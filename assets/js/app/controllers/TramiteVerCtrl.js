app.controller("TramiteVerCtrl", ["$scope", "$mdToast", "WAI", "FileUploader", "IdTramiteMovimiento", "$timeout", "API", "$http", "$mdDialog", "Tramite", "IsVer", function ($scope, $mdToast, WAI, FileUploader, IdTramiteMovimiento, $timeout, API, $http, $mdDialog, Tramite, IsVer) {


    $scope.tramite = Tramite.tramite;
    $scope.movimiento = Tramite.movimiento;
    $scope.archivos = Tramite.archivos;

    console.log("$scope.archivos", $scope.archivos);

    let fechas = {};
    //Omitir de la misma fecha (se están mostrando también los registros enviados a diferentes cargos)
    //$scope.items = Tramite.historial.filter(({fecha}) => fechas.indexOf(fecha) === -1 ? (fechas.push(fecha), true) : false);
    $scope.items = [];
    console.log("Tramite.historial", Tramite.historial);
    
    Tramite.historial.forEach((item, i) => {

        let archivos = $scope.archivos.filter(({id_tramite_movimiento}) => id_tramite_movimiento == item.id_tramite_movimiento);
        
        if(!(item.fecha in fechas)){
            fechas[item.fecha] = [];
            $scope.items.push(Object.assign(item, {archivos: archivos}));
        }

        fechas[item.fecha].push({
            id_usuario_destino: item.id_usuario_destino,
            destino_cargo: item.destino_cargo,
            destino_nombre_completo: item.destino_nombre_completo,
            destino_nombre_usuario: item.destino_nombre_usuario,
            destino_oficina: item.destino_oficina,
            destino_sede: item.destino_sede,
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

    $scope.linkAdjunto = nombre_archivo => $("base").prop("href") + "uploads/" + nombre_archivo;

    $scope.descargarAdjunto = (event, nombre_archivo) => {
        window.open($scope.linkAdjunto(nombre_archivo), "_blank");
    };
    
    $scope.crearLinkArchivo = (tramite, item, archivo_firma) => 
        archivo_firma 
        ? `./uploads/tramite_${String(tramite.id_tramite).padStart(8, '0')}/firmados/${String(item.id_tramite_movimiento_firma).padStart(10, '0')}.pdf`
        : `./uploads/tramite_${String(tramite.id_tramite).padStart(8, '0')}/${item.archivo}`;

    $scope.puedeFirmar = item => item.archivo.substr(-3) === "pdf";

    $scope.loading_firmas = {};

    $scope.firmar = (item, index, force) => {
        
        $scope.loading_firmas[item.id_tramite_movimiento_archivo] = true;

        $http.post(API.url("tramite", "firmar"), {
            id_tramite_movimiento_archivo: item.id_tramite_movimiento_archivo,
            force: force ? 1 : 0
        }).success(function(data){
            
            let mensaje = data.ok ? (data.mensaje || "Se ha firmado correctamente este documento") : data.mensaje;

            $scope.loading_firmas[item.id_tramite_movimiento_archivo] = false;

            if(data.ya_firmado){
            
                var confirm = $mdDialog.confirm()
                    .multiple(true)
                    .title('Confirmar')
                    .content('Ya has firmado este documento')
                    .ariaLabel('Firmar')
                    //.ok('Volver a Firmar')
                    .ok('Aceptar')
                    .cancel('Cancelar');
            
                $mdDialog.show(confirm).then(function() {
                    //$scope.firmar(item, index, true);
                });

                return;
            }
            
            $mdToast.show(
                $mdToast.simple()
                .textContent(mensaje)
                .hideDelay(2500));

            if(!data.ok) return;

            $scope.archivos[index].firmas = data.nuevas_firmas;

        });

    }

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

    $scope.exportar = function(type){
  
        return;

        $("#tabla-historico").DataTable({
            "processing": false,
            "serverSide": false,
            "iDisplayLength": 500,
            "aLengthMenu": [[500], [500]],
            "initComplete": function(){

                setTimeout(function(){
                    $("#tabla-historico_wrapper .buttons-" + type).trigger("click");
                } , 0);

            },
            "dom": "Blfrtip",
            "order": [[0, 'ASC']],
            fnRowCallback: function(){},
            "drawCallback": function(){

            },
            "buttons": [
                {
                    extend: 'copy',
            
                    text: '<span title="Copiar página activa"><i class="fa fa-copy"></i> Copiar</span>',
                    //action: newExportAction
                },
                {
                    extend: 'pdf',
                    orientation:  'landscape',
                    pageSize:  'A4',
                    
                },
                {
                    extend: 'excel',
                    customize: function ( xlsx ) {
                        var sheet = xlsx.xl.worksheets['sheet1.xml'];
                        // $('c[r=A1] t', sheet).text( 'Custom text' );
                        var sheet = xlsx.xl.worksheets['sheet1.xml'];
                        var numrows = 4;
                        var clR = $('row', sheet);
                         
                        //update Row
                        clR.each(function () {
                          var attr = $(this).attr('r');
                          var ind = parseInt(attr);
                          ind = ind + numrows;
                          $(this).attr("r", ind);
                        });
                         
                                           // Create row before data
                                             $('row c ', sheet).each(function (index) {
                                                   var attr = $(this).attr('r');
                         
                                                   var pre = attr.substring(0, 1);
                                                   var ind = parseInt(attr.substring(1, attr.length));
                                                   ind = ind + numrows;
                                                   $(this).attr("r", pre + ind);
                                               });
                         
                                               function Addrow(index, data) {
                                                var row = sheet.createElement('row');
                                                row.setAttribute("r", index);              
                                                   for (i = 0; i < data.length; i++) {
                                                       var key = data[i].key;
                                                       var value = data[i].value;
                         
                                                       var c  = sheet.createElement('c');
                                                       c.setAttribute("t", "inlineStr");
                                                       c.setAttribute("s", "2");
                                                       c.setAttribute("r", key + index);
                         
                                                       var is = sheet.createElement('is');
                                                       var t = sheet.createElement('t');
                                                       var text = sheet.createTextNode(value)
                         
                                                       t.appendChild(text);                                      
                                                       is.appendChild(t);
                                                       c.appendChild(is);
                         
                                                       row.appendChild(c);                                                                                                                         
                                                   }
                         
                                                   return row;
                                               }
                         
                        var r1 = Addrow(1, [{ key: 'A', value: '' }, { key: 'B', value: '' }]);
                        var r2 = Addrow(2, [{ key: 'A', value: '' }, { key: 'B', value: 'Aquí ícono de Cliente' }]);                          
                        var r3 = Addrow(3, [{ key: 'A', value: '' }, { key: 'B', value: '' }]);
                        var r4 = Addrow(4, [{ key: 'A', value: '' }, { key: 'B', value: '' }]);            
                         
                         
                                                var sheetData = sheet.getElementsByTagName('sheetData')[0];
                         
                                                sheetData.insertBefore(r4,sheetData.childNodes[0]);
                                                sheetData.insertBefore(r3,sheetData.childNodes[0]);
                                                sheetData.insertBefore(r2,sheetData.childNodes[0]);
                                                sheetData.insertBefore(r1,sheetData.childNodes[0]);
           
                    }
                    
                },
                {
                    extend: 'print',
                    orientation:  'landscape',
                    pageSize:  'A4',
                }
            ]
        });

    }


   
}]);