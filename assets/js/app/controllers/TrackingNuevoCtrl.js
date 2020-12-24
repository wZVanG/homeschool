angular.module('app').controller("TrackingNuevoCtrl", ["$scope", "API", "DoksUtils", "WAI", "$http", "$timeout", "$interval", "FileUploader", "$mdToast", "$state", "$filter", "Usuario", "Cliente", function($scope, API, DoksUtils, WAI, $http, $timeout, $interval, FileUploader, $mdToast, $state, $filter, Usuario, Cliente){


    $scope.loading = false;

    $scope.fecha_hoy = moment().hour(0).minute(0).second(0).toDate();
    $scope.fecha_hoy_moment = moment($scope.fecha_hoy);

    $scope.seleccionar_tipo_origen = 1;

    $scope.registro_info = {
        id_servicio: 1,
        flag_compra_cliente: 0,
        flag_envio_cliente: 0,
        //id_local_recepcion: 1,       
        archivos: [],
        upc: ""
    };

    let producto_blank = {
        cantidad: 1,
        id_unidad_medida: 2
    };

    function resetProducto(){
        $scope.producto.nombre_producto = "";
        $scope.producto.cantidad = 1;
        $scope.producto.precio = undefined;
        $scope.producto.foto = undefined;
        $scope.producto.upc = "";
    }

    $scope.productos = [];

    $scope.producto = angular.copy(producto_blank);

    $scope.agregarProducto = () => {
        $scope.productos.push(angular.copy($scope.producto));
        resetProducto()
    };

    $scope.textAgregarProducto = ( ) => {
        //let nombre_producto = $filter("parametroCollection")
        const default_text = "Ingrese el producto";
        let unidad_medida = $filter("parametroCollection")($scope.producto.id_unidad_medida, "unidad_medida", "id_unidad_medida", "nombre");
        if(!String($scope.producto.nombre_producto || "").length) return default_text;
        //if($scope.producto.precio === undefined) return "Ingrese precio del producto";
        let text = `(${$scope.producto.cantidad} ${unidad_medida}) - ${$scope.producto.nombre_producto}: ${$filter("moneda")($scope.producto.precio || 0)}`;
        
        return text;
    }

    $scope.validProducto = () => {
        return $scope.producto.cantidad > 0 && String($scope.producto.nombre_producto||"").length
        && $scope.producto.precio !== undefined && $scope.producto.id_categoria
        && $scope.producto.id_unidad_medida;
    }

    //Crud
	let scope_crud_clientes = {
		/*registro_info: {CLI_IdCliente: }*/
	};
	$scope.crud_cliente = API.crud("clientes", scope_crud_clientes, null, function(){
        console.log("MODAL OPENEND!")
    });
	$scope.crud_cliente_callbacks = {
		onSave: (result, crud_params) => {
            
			//const integrante_index = crud_params[0];
			let item = result.item;

            $scope.BuscarTemp.id_cliente = angular.copy(item);
            $scope.BuscarTextos.id_cliente = item.nombre_completo;
            $scope.registro_info.id_cliente = item.id_cliente;

		}
	};
    
    $scope.$watch("registro_info.id_servicio", (value) => {
        if(value === undefined) return;

        $scope.registro_info.flag_compra_cliente = value == 1 ? 1 : 0;

    });

    Cliente.preScripts('TramiteNuevoCtrl', $scope);

    $scope.openUpload = () => {
        $("#foto_wrap [ngf-pattern]").trigger("click")
    };
    

    $scope.BuscarTemp = {id_cliente: void 0};
    $scope.BuscarTextos = {id_cliente: ''};

    $scope.$watchCollection("BuscarTemp",function(items){
        
        if(!items) return;
        //console.log("items", items);
        angular.forEach(items,function(value, key){

            console.log("value", value)
            
            if(value) $scope.registro_info[key] = value[key];

            //Para evitar error en crud (variable items loading)
            //if(key == 0) $scope.registro_info['CLI_IdCliente'] = value[key];

            if(key === 'id_cliente' && value){

                if(!scope_crud_clientes.items) scope_crud_clientes.items = {};
                scope_crud_clientes.items[value.id_cliente] = {loading: false};
            }
            
            
        })
    });
    
    $scope.BuscarFn = {};
    $scope.BuscarFn.personas = API.autocompleteList('personas');
    $scope.BuscarFn.clientes = API.autocompleteList('clientes');

    $scope.guardar = guardar;

    function guardar(){
        /*console.log("registro_info", $scope.registro_info);
        return;*/

        if($scope.loading) return;

        /*if($scope.formulario.$invalid) return  $mdToast.show(
            $mdToast.simple()
            .textContent("Por favor, revise campos del formulario")
            .hideDelay(2500));*/

        if(!Cliente.preScripts('GuardarTramiteNuevo', $scope)) return;

        $scope.loading = true;

        console.log("$scope.registro_info", $scope.registro_info);

        let post_data = Object.assign({}, $scope.registro_info, {productos: $scope.productos});

        $http.post(API.url("tracking", "guardar"), post_data).success(function(data){

            let mensaje = data.ok ? (data.mensaje || "Registrado exitosamente") : data.mensaje;
            
            $mdToast.show(
                $mdToast.simple()
                .textContent(mensaje)
                .hideDelay(2500));

            if(!data.ok) return;

            $state.go("fliperang.tracking.envios");
        }).finally(() => {
            $scope.loading = false
        });
    }


    $scope.eliminarArchivo = function(archivo, num){
        if(typeof archivo === "object") archivo.remove();
        else if(typeof archivo === "number") $scope.registro_info['archivos'].splice(num, 1);
        angular.element("#archivo_" + num).val("");
                
    };

    var uploaders = [];
    $scope.uploaders = [];
    $scope.subiendo = [];

    const makeUploader = () => {

        $scope.registro_info.flag_adjunto = true;

        const num = uploaders.push(null) - 1;
        
        $scope.subiendo.push(null);
        $scope.uploaders.push(null);
        $scope.registro_info['archivos'].push(null);

        console.log("uploaders", uploaders);
   
        $scope.subiendo[num] = false;   

        uploaders[num] = $scope.uploaders[num] = new FileUploader({
            url: API.url("tramite", "upload")
        });
    
        uploaders[num].filters.push({
            name: 'customFilter',
            fn: function(item /*{File|FileLikeObject}*/, options) {
                return this.queue.length <= 1;
            }
        });
    
        uploaders[num].onCompleteItem = function(fileItem, response, status, headers) {

            if(response.error){
                $mdToast.show(
                    $mdToast.simple()
                    .textContent(response.mensaje)
                    .hideDelay(2000));
                    uploaders[num].queue.length && $scope.eliminarArchivo(uploaders[num].queue[0], num); 
                return;
            }

            $scope.registro_info['archivos'][num] = [response.upload_data.file_name, response.upload_data.orig_name];
            uploaders[num].queue = []

        };
    
        uploaders[num].onCompleteAll = function() {
            $scope.subiendo[num] = false;
        };
    
    };

    $scope.makeUploader = makeUploader;

    makeUploader();

    /*
    $scope.archivo_subiendo = false;

    var uploader = $scope.uploader = new FileUploader({
        url: API.url("tramite", "upload")
    });

    // FILTERS

    uploader.filters.push({
        name: 'customFilter',
        fn: function(item , options) {
            console.log("options", item.type);
            //Permitir solo pdfs en externos
            if($scope.registro_info.tipo_origen == 2 && item.type !== 'application/pdf'){
                $mdToast.show(
                    $mdToast.simple()
                    .textContent("Solo se permite archivos PDF para documentos externos")
                    .hideDelay(3e3));
                return false;
            }
            return this.queue.length <= 1;
        }
    });

   uploader.onProgressItem = function(fileItem, progress) {
    $scope.archivo_subiendo = true;
    console.info('subiento...', fileItem, progress);
};
   uploader.onCompleteItem = function(fileItem, response, status, headers) {
        if(response.error){
            $mdToast.show(
                $mdToast.simple()
                .textContent(response.mensaje)
                .hideDelay(2000));
            uploader.queue.length && $scope.eliminarArchivo(uploader.queue[0]); 
            return;
        } 
        $scope.registro_info.nombre_archivo = response.upload_data.file_name;
    };

    uploader.onCompleteAll = function() {
        console.info('onCompleteAll');
        //uploader.queue[0].remove();
        $scope.archivo_subiendo = false;
    };


    $scope.$watch(function(){
        return $scope.uploader.queue.length;
    }, function(length){
        $scope.registro_info.flag_adjunto = length ? 1 : 0;
    });

    $scope.eliminarArchivo = function(archivo){
        archivo.remove();
        angular.element("#adjuntar_archivo").val("");
        delete $scope.registro_info.nombre_archivo;
    };
   
    console.info('uploader', uploader);*/


}])