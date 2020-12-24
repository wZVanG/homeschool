angular.module('app').controller("TramiteMovimientosCtrl", ["$scope", "API", "WAIUtils", "$compile", "$filter", "$mdDialog", "Sedes", "Oficinas", "Areas", "Info", "$http", "$templateCache", "Callbacks", function($scope, API, WAIUtils, $compile, $filter, $mdDialog, Sedes, Oficinas, Areas, Info, $http, $templateCache, Callbacks){

    var sedes = $scope.sedes = Sedes;
    var oficinas = $scope.oficinas = Oficinas;
    var areas = $scope.areas = Areas;

    //Preloar ver/atender.html
    $http.get("assets/views/gestion/ver.html", { cache: $templateCache });
    $http.get("assets/views/gestion/atender.html", { cache: $templateCache });

    //const visible_emisor = ["recibidos", "pendientes", "atendidos", "archivados"].indexOf(Info.name) !== -1;
    const visible_emisor = false;
    const visible_destinatario = ["enviados"].indexOf(Info.name) !== -1;

    const escape = data => $filter("linky")(data||'');
    const cellValue = data => `'${escape((data||"").replace(/'/, "\\'"))}'`;


    $scope.dtOptions = {
        "ajax": {
            url: API.url("tramite", "listar", Info.name),
            method: "POST"
        },
        "columns": [
            { "title": "ID Trámite Movimiento", "visible": false, "searchable": false },
            { "title": "Origen", "visible": false, "searchable": false, "class": "cell-export", render: (data, type, row) => {
                return `<div class="export-content">${escape($filter("tipo_origen")(data))}</div>`;
            } },
            { "title": "Empresa", "visible": false, "searchable": false, "class": "cell-export", render: (data, type, row) => {
                return `<div class="export-content">${escape(data)}</div>`;
            }  },
            { "title": "id_empresa_externo", "visible": false, "searchable": false },
            { "title": "tipo_movimiento", "visible": false, "searchable": false }, //	1:Apertura,2:Derivar,3:Cierre
            { "title": "Cargo origen", "visible": false, "searchable": true, "class": "cell-export", render: (data, type, row) => {
                return `<div class="export-content">${escape(data)}</div>`;
            }  },
            { "title": "Oficina origen", "visible": false, "searchable": true, "class": "cell-export", render: (data, type, row) => {
                return `<div class="export-content">${escape(data)}</div>`;
            }  },
            { "title": "Cargo destino", "visible": false, "searchable": true, "class": "cell-export", render: (data, type, row) => {
                return `<div class="export-content">${escape(data)}</div>`;
            }  },
            { "title": "Oficina destino", "visible": false, "searchable": true, "class": "cell-export", render: (data, a, row) => {
                return `<div>${data}</div> <div class="export-content">${escape(data)}</div>`; //Interno, mostrar oficina
                if(row[1] == 1) return `<div>${data}</div> <div class="export-content">${escape(data)}</div>`; //Interno, mostrar oficina
                return data + "<br><small class='md-caption'>" + row[2] + "</small>";
            } },
            { "title": "Emisor", "visible": visible_emisor, "searchable": true, "class": "cell-export", render: (data, type, row) => {
                const reemplazo = row[22];
                return `<div class="export-content">${escape(data)}</div>`;
            } },

            { "title": "Código", "visible": true, "width": "150", "searchable": true, "class": "cell-export", "sortable": false, render: (data, type, row) => {
                const origen = row[1], origen_denominacion = $filter("tipo_origen")(origen);
                const documento = row[16];
                const prioridad_value = row[21];
            
                return `
                    <div class="movimiento-codigo-wrap">
                        <div title="Documento ${origen_denominacion}"><md-icon>${origen == 1 ? '360' : 'scatter_plot'}</md-icon>${$filter("codigo_tramite")(data, row[1])} <span movimiento-prioridad="${prioridad_value}"></span></div>
                        <div md-truncate title="{{${cellValue(documento)}}}"><md-icon>class</md-icon>{{${cellValue(documento)}}}</div>
                    </div>
                    <div class="export-content">${escape(data)}</div>
                `;
            } },
            { "title": "Acción", "visible": false, "width": 80, "searchable": true, "class": "cell-export", render: (data, type, row) => {
                return `<div class="export-content">${escape(data)}</div>`;
            }  },
            { "title": "Adjunto", "visible": false, "searchable": false, "class": "cell-export", render: (data, type, row) => {
                return `<div class="export-content">${data == 1 ? 'SI' : 'NO'}</div>`;
            }  },
            { "title": "Archivo adjunto", "visible": false, "searchable": false, "class": "cell-export", render: (data, type, row) => {
                if(!data) return '';
                let url = `${location.origin}/uploads/${escape(data)}`;
                return `<div class="export-content"><a href="${url}" target="_blank">${url}</a></div>`;
            }  },
            { "title": "Fecha", "visible": false, "searchable": true, width: "150", "class": "cell-export", render: (data) => {
                return `
                    <div ng-bind="'${data}' | fecha"></div>
                    <div class="export-content">${escape(data)}</div>
                `;
            } },

            { "title": "Estado destinatario", "visible": false, "searchable": false, "class": "cell-export---", render: (data, type, row) => {
                return `<div class="export-content">${escape(data)}</div>`;
            }  }, //1:Recibido,2:Atendido,3:Derivado,4:Archivado	
            { "title": "Documento", "visible": false, "searchable": true, "class": "cell-export", render: (data, type, row) => {
                return `<div class="export-content">${escape(data)}</div>`;
            }  },
            { "title": "Asunto", "visible": false, "searchable": true, "class": "cell-export", render: (data, type, row) => {
                return `<div class="export-content">${escape(data)}</div>`;
            }},
            { "title": "periodo_max", "visible": false, "searchable": true, "class": "cell-export__", render: (data, type, row) => {
                return `
                    <div class="export-content">${escape(data)}</div>
                `;
            }},

            { "title": visible_destinatario ? "Destinatario" : "Origen", "visible": true, "sortable": false, "searchable": true, width: "30%", "class": "cell-export", render: (data, a, row) => {
                return visible_destinatario 
                ? `
                    <div class="autor-origen" md-truncate><span ng-bind="${cellValue(row[7])}"></span> - <span ng-bind="${cellValue(row[8])}"></span></div>
                    <div class="autor-nombre" ng-bind="${cellValue(data)}"></div>
                    <div class="export-content">${escape(data)}</div>
                ` 
                : `
                    <div class="autor-origen" md-truncate><span ng-bind="${cellValue(row[5])}"></span> - <span ng-bind="${cellValue(row[6])}"></span></div>
                    <div class="autor-nombre" ng-bind="${cellValue(row[9])}"></div>
                    <div class="export-content">${cellValue(row[9])}</div>
                `;
            }},
            { "title": "Mensaje", "visible": true, "searchable": true, className:"movimiento-td cell-export", "sortable": false, render: (data, type, row) => {
                
                const fecha = row[14];
                const id = row[0];
                const accion_denominacion = row[11];
                const asunto = row[17];
                const flag_adjunto = row[12];
                const archivo_adjunto = row[13];

                let html = '';
                html += `
                <div><md-tooltip>Ver</md-tooltip><md-button ng-click="historial($event, ${id}, 1)" class="md-icon-button md-primary"><md-icon>remove_red_eye</md-icon></md-button></div>
                <div><md-tooltip>Histórico</md-tooltip><md-button ng-click="historial($event, ${id})" class="md-icon-button md-primary"><md-icon>history</md-icon></md-button></div>
                `;
                if(Info.name === "pendientes"){
                    html += `
                    <div><md-tooltip>Atender</md-tooltip><md-button ng-click="atender($event, ${id}, 1)" class="md-icon-button md-primary"><md-icon>assignment_turned_in</md-icon></md-button></div>
                    <div><md-tooltip>Archivar</md-tooltip><md-button ng-click="atender($event, ${id}, 0)" class="md-icon-button md-primary"><md-icon>lock</md-icon></md-button></div>
                    `;
                }

                let html_acciones = `
                    <div layout="row">
                    ${html}
                    </div>
                `;

                return `
                <div class="movimiento-wrap">
                    <div md-truncate class="text" title="{{${cellValue(data)}}}"><span ng-bind="${cellValue(asunto)}"></span> - <span ng-bind="${cellValue(data)}"></span></div>
                    <div>
                        <span class="label bg-primary">${accion_denominacion}</span> 
                        <!--<md-button ng-click="descargarAdjunto($event, '${archivo_adjunto}')" ng-show="${flag_adjunto == 1 ? 'true' : 'false'}" class="adjunto-button md-icon-button" title="${archivo_adjunto}"><md-icon>attach_file</md-icon></md-button>-->
                    </div>
                    <div class="movimiento-fecha" title="{{'${fecha}' | amDateFormat:'LLLL'}}">{{'${fecha}' | amTimeAgo}}</div>
                    <div class="movimiento-acciones">
                        ${html_acciones}
                    </div>
                </div>
                <div class="export-content">${escape(data).substr(0, 50)}</div>
                `;
            } },
            { "title": "Prioridad", "visible": false, "searchable": true, "class": "cell-export", render: (data, type, row) => {
                return `<div class="export-content">${escape(data)}</div>`;
            }},

            { "title": "Reemplazo", "visible": false, "searchable": false, "class": "cell-export", render: (data, type, row) => {
                return `<div class="export-content">${escape(data)}</div>`;
            }},

            { "title": 'Acciones', "width": "1%", "orderable": false, "visible": false, "render": function (data, type, row) {

                return ''
            }
            },
//            { "title": "ID", "visible": false, "class": "cell-export", "searchable": false, "render": (...args) => args[3][0]},
        ]
    };

    Callbacks.ctrlMovimientosInit.apply(this, arguments);

    $scope.atender = function(ev, id, is_derivar){
        $mdDialog.show({
            controller: 'TramiteAtenderCtrl',
            templateUrl: "./assets/views/gestion/atender.html",
            preserveScope: true,
            multiple: true,
            targetEvent: ev,
            clickOutsideToClose: true,
            escapeToClose: true,
            fullscreen: true,
            resolve: {
                IdTramiteMovimiento: () => id,
                IsDerivar: () => is_derivar,
                Sedes: () => Sedes,
                Areas: () => Areas,
                Oficinas: () => Oficinas,
            }
        }).then(function (answer) {
        }, function () {
        });
    };

    $scope.historial = function(ev, id, ver){
        $mdDialog.show({
            controller: 'TramiteVerCtrl',
            templateUrl: "./assets/views/gestion/ver.html",
            preserveScope: true,
            multiple: true,
            targetEvent: ev,
            clickOutsideToClose: true,
            escapeToClose: true,
            fullscreen: true,
            resolve: {
                IdTramiteMovimiento: () => id,
                IsVer: () => !!ver,
                Sedes: () => Sedes,
                Oficinas: () => Oficinas,
                Tramite: ["$http", "$q", ($http, $q) => {
                    let defer = $q.defer();
                    $http.get(API.url("tramite", "ver", id)).success(function(response){
                        defer.resolve(response)
                    });
                    return defer.promise
                }]
            }
        }).then(function (answer) {
        }, function () {
        });
    };

    $scope.descargarAdjunto = (event, nombre_archivo) => {
        window.open("./uploads/" + nombre_archivo, "_blank");
    }

}])