angular.module('app').controller("TramiteNuevoCtrl", ["$scope", "API", "DoksUtils", "Sedes", "Oficinas", "Areas", "WAI", "$http", "$timeout", "$interval", "FileUploader", "$mdToast", "$state", "Usuario", "Cliente", function($scope, API, DoksUtils, Sedes, Oficinas, Areas, WAI, $http, $timeout, $interval, FileUploader, $mdToast, $state, Usuario, Cliente){

    $scope.sedes = Sedes;
    $scope.oficinas = Oficinas;
    $scope.areas = Areas;
    $scope.cargos_usuarios = [];

    $scope.loading = false;
    $scope.registro_info = {
        id_accion: null,
        flag_fisico: 0,
        flag_adjunto: 0,
        id_tipo_documento: 2,
        tipo_origen: 1,
        id_empresa_externo: 1,
        destinatarios: [],
        id_area: 1,
        numero_folios: 0,
        prioridad: 3,
        archivos: []
    };

    $scope.seleccionar_tipo_origen = true;

    Cliente.preScripts('TramiteNuevoCtrl', $scope);

    $scope.BuscarTemp = {};
    $scope.BuscarTextos = {};

    $scope.$watchCollection("BuscarTemp",function(items){
        
        if(!items) return;
        //console.log("items", items);
        angular.forEach(items,function(value, key){
            
            if(value) $scope.registro_info[key] = value[key];
        })
    });
    
    $scope.BuscarFn = {};
    $scope.BuscarFn.personas = API.autocompleteList('personas');

    $scope.$watch("registro_info.id_persona", function(value){
        if(value) $scope.registro_info.id_empresa_externo = value;
    });

    $scope.contar = (tipo, value) => {
        switch(tipo){
            case 'oficinas':
                return $scope.oficinas.filter(({id_sede, id_area}) => id_sede == $scope.destinatario.id_sede && id_area == value).length;
                break;
            /*case 'cargos':
                return $scope.cargos_usuarios.filter(({id_oficina}) => id_oficina == value).length;
                break;*/
        }
    };

    $scope.destinatarios = [];

    var destinatario_blank = {
        id_sede: WAI.config.sede_unica ? 1 : $scope.sedes.find(item => item.id_sede == 1).id_sede,
        id_oficina: null,
        id_area:1,
        id_cargo_usuario: null
    };

    $scope.destinatario = destinatario_blank;
    $scope.destinatario_selected = null;

    resetDestinatario();

    let agregarTodosTimer;
    $scope.agregarTodosAdding = false;
    $scope.agregarDestinatarioTodos = (ev) => {
        if($scope.agregarTodosAdding) return;
        $scope.agregarTodosAdding = true;
        $scope.destinatarios = [];
        let index = 0;
        agregarTodosTimer = $interval(() => {
            if(index === $scope.cargos_usuarios.length){
                $scope.agregarTodosAdding = false;
                $interval.cancel(agregarTodosTimer);
                return;
            };
            $scope.destinatarios.push(angular.copy($scope.cargos_usuarios[index++]));
        }, 100);
        
    };

    $scope.agregarDestinatario = (ev) => {
        $scope.destinatarios.push(angular.copy($scope.destinatario_selected));
        resetDestinatario();
    };
    $scope.eliminarDestinatario = (ev, value) => {
        
        const index = $scope.destinatarios.findIndex(item => item.id_cargo_usuario == value);
        if(index > -1) $scope.destinatarios.splice(index, 1);
    };
    $scope.destinatarioExistente  = id_cargo_usuario => $scope.destinatarios.some(item => item.id_cargo_usuario == id_cargo_usuario);

    $scope.guardar = guardar;

    $scope.$watch("destinatarios", (value) => {
        if(value) $scope.registro_info.destinatarios = value.map(item => +item.id_cargo_usuario);
    }, true);

    $scope.$watch("destinatario.id_sede", function(value){
        $scope.destinatario.id_oficina = undefined;
        if(value){
            var primera_oficina = $scope.oficinas.filter(item => item.id_sede == value); 
            if(primera_oficina.length) $scope.destinatario.id_oficina = primera_oficina[0].id_oficina;
        }
    });

    $scope.$watch("destinatario.id_oficina", function(value){
        $scope.cargos_usuarios = [];
        $scope.destinatario.id_cargo_usuario = null;
        
        if(value){
            $http.get(API.url("cargos_usuarios", "listar_todos") + "?id_oficina=" + $scope.destinatario.id_oficina, {id_oficina: $scope.destinatario.id_oficina}).success(function(data){
                $scope.cargos_usuarios = data;
            });
        }
    });

    function resetDestinatario(){
        $scope.destinatario.id_oficina = null;
        $scope.destinatario_selected = null;
        $scope.cargos_usuarios = [];
        $timeout(function(){
            $scope.destinatario = Object.assign(angular.copy(destinatario_blank));
        });
    }

    function guardar(){
        //console.log("registro_info", $scope.registro_info);

        if($scope.loading) return;

        if(!Cliente.preScripts('GuardarTramiteNuevo', $scope)) return;

        $scope.loading = true;

        console.log("$scope.registro_info", $scope.registro_info);

        $http.post(API.url("tramite", "guardar"), $scope.registro_info).success(function(data){

            let mensaje = data.ok ? (data.mensaje || "Documento enviado exitosamente") : data.mensaje;

            $scope.loading = false;
            
            $mdToast.show(
                $mdToast.simple()
                .textContent(mensaje)
                .hideDelay(2500));

            if(!data.ok) return;

            $state.go("gestion.tramite.enviados");
        });
    }

    $scope.test = () => {
        $scope.registro_info.asunto = "Foo asunto";
        $scope.registro_info.mensaje = "Este es un mensaje";
        $scope.registro_info.id_accion = 3;
        $scope.registro_info.documento = "15756";
    };

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