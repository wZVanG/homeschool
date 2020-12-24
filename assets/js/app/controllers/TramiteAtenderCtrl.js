app.controller("TramiteAtenderCtrl", ["$scope", "$mdToast", "WAI", "FileUploader", "IdTramiteMovimiento", "$timeout", "API", "$http", "$mdDialog", "IsDerivar", "Sedes", "Oficinas", "Areas", "$state", "$interval", function ($scope, $mdToast, WAI, FileUploader, IdTramiteMovimiento, $timeout, API, $http, $mdDialog, IsDerivar, Sedes, Oficinas, Areas, $state, $interval) {

    $scope.sedes = Sedes;
    $scope.oficinas = Oficinas;
    $scope.areas = Areas;

    $scope.cargos_usuarios = [];
    
    $scope.WAI = WAI;
    
    $scope.registro_info = {
        id_tramite_movimiento: IdTramiteMovimiento,
        id_accion: null,
        flag_adjunto: 0,
        destinatarios: [],
        derivar: IsDerivar ? 1 : 2,
        archivos: []
    };
    $scope.loading = false;

    $scope.BuscarTemp = {};
    $scope.BuscarTextos = {};

    $scope.is_derivar = $scope.registro_info.derivar;

    $scope.$watch("registro_info.derivar", value => {
        if(value){
            $scope.is_derivar = value == 1;
            $scope.registro_info.id_accion = $scope.is_derivar ? 5 : 10;
        }
    });

    $scope.$watchCollection("BuscarTemp",function(items){
        
        if(!items) return;
        angular.forEach(items,function(value, key){
            if(value) $scope.registro_info[key] = value[key];
        })
    });
    
    $scope.BuscarFn = {};
    //$scope.BuscarFn.empresas = API.autocompleteList('empresas');

    $scope.destinatarios = [];
    var destinatario_blank = {
        id_sede: WAI.config.sede_unica ? 1 : $scope.sedes.find(item => item.id_sede == 1).id_sede,
        id_oficina: null,
        id_area: 1,
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
    
    $scope.hide = function () {
        $mdDialog.hide();
    };

    $scope.cancel = function () {
        $mdDialog.cancel();
    };

    $scope.guardar = function () {

        if($scope.formulario.$invalid) return;

        $scope.loading = true;

        $http.post(API.url("tramite", "derivar"), $scope.registro_info).success(function(data){
            
            let mensaje = data.ok ? (data.mensaje || "Se ha derivado el documento correctamente") : data.mensaje;

            $scope.loading = false;
            
            $mdToast.show(
                $mdToast.simple()
                .textContent(mensaje)
                .hideDelay(2500));

            if(!data.ok) return;

            $mdDialog.hide();

            $state.go("gestion.tramite.enviados");
        });

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

}]);