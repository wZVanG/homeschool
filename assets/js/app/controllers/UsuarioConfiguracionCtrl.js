angular.module('app').controller("UsuarioConfiguracionCtrl", ["$scope", "$http", "API", "WAI", "FileUploader", "$mdToast", "$timeout", "UbigeoDepartamentos", function($scope, $http, API, WAI, FileUploader, $mdToast, $timeout, UbigeoDepartamentos){
    
    $scope.usuario_info = WAI.usuario.info;
    $scope.usuario_password = {};

    $scope.ubigeo = {departamento: $scope.usuario_info.departamento, provincia: $scope.usuario_info.provincia, distrito: $scope.usuario_info.distrito};
    $scope.UbigeoDepartamentos = UbigeoDepartamentos || [];
    $scope.UbigeoProvincias = [$scope.usuario_info.provincia];
    $scope.UbigeoDistritos = [$scope.usuario_info.distrito];
    let KeyDistritos = {};

    $scope.foto_nuevo = false;
    $scope.loading = false;
    
    $scope.$watch('ubigeo.departamento', value => {
        if(!value) return;
        $http.post(API.url("Ubigeo", "provincias", `?departamento=${value}`)).success(data => {
            $scope.UbigeoProvincias = data;
            $scope.usuario_info.provincia = data[0];
        });
    });

    $scope.$watch('ubigeo.provincia', value => {
        if(!value) return;
        $http.post(API.url("Ubigeo", "distritos", `?departamento=${$scope.ubigeo.departamento}&provincia=${value}`)).success(data => {
            $scope.UbigeoDistritos = data.map(item => item[1]);
            data.forEach(item => (KeyDistritos[item[1]] = item[0]));
            $scope.usuario_info.distrito = data[0];
        });
    });

    $timeout(() => {

        $scope.$watch('ubigeo.distrito', value => {
            if(!value) return;
            if(KeyDistritos[value]) $scope.usuario_info.ubigeo = KeyDistritos[value];
        }, true);

    });

        
    function guardar(tipo){
        //console.log("registro_info", $scope.registro_info);

        if($scope.loading) return;

        $scope.loading = true;

        $http.post(API.url("usuario", "guardar"), Object.assign({}, tipo === 'password' ? $scope.usuario_password : $scope.usuario_info, {tipo: tipo})).success(function(data){

            let mensaje = data.ok ? (data.mensaje || "Guardado correctamente") : data.mensaje;

            $scope.loading = false;
            
            $mdToast.show(
                $mdToast.simple()
                .textContent(mensaje)
                .hideDelay(2500));

            if(!data.ok) return;

            //$state.go("gestion.tramite.enviados");
        });
    }

    $scope.guardar = guardar;

    $scope.archivo_subiendo = false;   

    var uploader = $scope.uploader = new FileUploader({
        url: API.url("usuario", "upload")
    });

    // FILTERS

    uploader.filters.push({
        name: 'customFilter',
        fn: function(item /*{File|FileLikeObject}*/, options) {
            return this.queue.length <= 1;
        }
    });

   uploader.onCompleteItem = function(fileItem, response, status, headers) {
        if(response.error){
            $mdToast.show(
                $mdToast.simple()
                .textContent(response.mensaje)
                .hideDelay(2000));
            uploader.queue.length && $scope.eliminarArchivo(uploader.queue[0], "nombre_archivo"); 
            return;
        } 
        console.log("response.upload_data", response.upload_data);
        $scope.usuario_info.foto = response.upload_data.file_name;
        uploader.queue = []
    };

    uploader.onCompleteAll = function() {
        console.info('onCompleteAll');
        //uploader.queue[0].remove();
        $scope.archivo_subiendo = false;
    };

    $scope.eliminarArchivo = function(archivo, nombre_archivo){
        archivo.remove();
        angular.element("#" + nombre_archivo).val("");
        delete $scope.usuario_info[nombre_archivo];
    };


    $scope.$watch(function(){
        return $scope.uploader.queue.length;
    }, function(length){
        $scope.foto_nuevo = length ? 1 : 0;
    });

    // F I R M A 

    var uploaders = {};
    $scope.uploaders = {};
    $scope.subiendo = {};

    const makeUploader = (num) => {
   
        $scope.subiendo[num] = false;   

        uploaders[num] = $scope.uploaders[num] = new FileUploader({
            url: API.url("usuario", "signload") + `?firma_numero=${num}`
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
                    uploaders[num].queue.length && $scope.eliminarArchivo(uploaders[num].queue[0], `archivo_${num}`); 
                return;
            } 
            console.log("response.upload_data", response.upload_data);
            $scope.usuario_info["archivo_" + num] = response.upload_data.file_name;
            uploaders[num].queue = []
        };
    
        uploaders[num].onCompleteAll = function() {
            $scope.subiendo[num] = false;
        };
    
    }

    makeUploader(1);
    makeUploader(2);
 

}])