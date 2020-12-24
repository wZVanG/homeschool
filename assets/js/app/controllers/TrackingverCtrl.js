app.controller("TrackingVerCtrl", ["$scope", "$mdToast", "WAI", "FileUploader", "IdTramiteMovimiento", "$timeout", "API", "$http", "$mdDialog", "Tramite", "IsVer", function ($scope, $mdToast, WAI, FileUploader, IdTramiteMovimiento, $timeout, API, $http, $mdDialog, Tramite, IsVer) {


    $scope.tramite = Tramite.venta;
    $scope.movimiento = Tramite.movimiento;
    $scope.archivos = Tramite.archivos || [];

    console.log("$scope.archivos", $scope.archivos);

    let fechas = {};
    //Omitir de la misma fecha (se están mostrando también los registros enviados a diferentes cargos)
    //$scope.items = Tramite.historial.filter(({fecha}) => fechas.indexOf(fecha) === -1 ? (fechas.push(fecha), true) : false);
    //$scope.items = [];
    $scope.items = Tramite.historial;
    console.log("Tramite.historial", Tramite.historial);
    
    Tramite.historial.forEach((item, i) => {

        let archivos = $scope.archivos.filter(({id_tramite_movimiento}) => id_tramite_movimiento == item.id_tramite_movimiento);
        
        if(!(item.fecha in fechas)){
            fechas[item.fecha] = [];
            $scope.items.push(Object.assign(item, {archivos: archivos}));
        }

        console.log("item", item);

        fechas[item.fecha].push({
            id_usuario_destino: item.id_usuario_destino,
            destino_cargo: item.cargo,
            destino_nombre_completo: item.nombre_completo,
            destino_nombre_usuario: item.nombre_usuario,
            destino_oficina: item.oficina,
            destino_sede: item.sede,
        });

        item.destinos = fechas[item.fecha];
    });

    $scope.is_ver = IsVer; 
    $scope.selectedIndex = IsVer ? 0 : 1;

    $scope.cargos_usuarios = [];
    
    $scope.WAI = WAI;
 
    
    $scope.hide = function () {
        $mdDialog.hide();
    };

    $scope.cancel = function () {
        $mdDialog.cancel();
    };

   

    let apertura = false, derivacion = false, cierre = false;
    $scope.timelineHeader = (item) => {
        if(item.header) return true;
        else if(item.tipo_movimiento == 1 && !apertura) return (apertura = true, item.header = true);
        else if(item.tipo_movimiento == 2 && !derivacion) return (derivacion = true, item.header = true);
        else if(item.tipo_movimiento == 3 && !cierre) return (cierre = true, item.header = true);
        return false;
    };

    $scope.timelineText = (item) => {
        return ({
            1: "Inicio",
            2: "Derivar",
            3: "Archivado"
        })[item.tipo_movimiento];
    };



   
}]);