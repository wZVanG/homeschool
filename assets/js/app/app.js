window.ENV_TESTING = location.host === "localhost";

angular.module('app').config(["$stateProvider", "$locationProvider", "MODULE_CONFIG", "$httpProvider", "$mdDateLocaleProvider", "uiGmapGoogleMapApiProvider", "$mdThemingProvider", "CallbacksProvider", function ($stateProvider, $locationProvider, MODULE_CONFIG, $httpProvider, $mdDateLocaleProvider, uiGmapGoogleMapApiProvider, $mdThemingProvider, CallbacksProvider) {

    
  $mdThemingProvider.theme('default')
  .primaryPalette('purple')
  .accentPalette('teal')
  .warnPalette('deep-orange')
  .backgroundPalette('grey');

    uiGmapGoogleMapApiProvider.configure({
        china: true
    });

    function d(a, b) {
        return {
            deps: ["$ocLazyLoad", "$q", function (d, e) {
                var f = e.defer(),
                    g = !1;
                return a = angular.isArray(a) ? a : a.split(/\s+/), g || (g = f.promise), angular.forEach(a, function (a) {
                    g = g.then(function () {
                        return angular.forEach(MODULE_CONFIG, function (b) {
                            b.name == a ? b.module ? name = b.name : name = b.files : name = a
                        }), d.load(name)
                    })
                }), f.resolve(), b ? g.then(function () {
                    return b()
                }) : g
            }]
        }
    }

    $httpProvider.interceptors.push('httpInterceptor');


        //Sincronizar hora moment con hora del servidor
    /*var offset = moment(SISTEMA_CONFIG.pagina.server_time).valueOf() - Date.now();
    moment.now = function() { return moment(Date.now() + offset); };*/

    //Arreglar formato fechas

    /**
     * @param date {Date}
     * @returns {string} string representation of the provided date
     */
    $mdDateLocaleProvider.formatDate = function(date) {
        return date ? moment(date).format('DD/MM/YYYY') : '';
      };

    var months = [],
        shortMonths = [],
        shortDays = [];
    for (var i = 0; i < 12; i++) {
        var date = moment().month(i);
        months.push(date.format("MMMM"));
        shortMonths.push(date.format("MMM"));
    }
    for (var i = 0; i < 7; i++) {
        var date = moment().day(i);
        shortDays.push(date.format("dd"));
    }
    $mdDateLocaleProvider.firstDayOfWeek = 1;
    $mdDateLocaleProvider.months = months;
    $mdDateLocaleProvider.shortMonths = shortMonths;
    $mdDateLocaleProvider.shortDays = shortDays;
  
      /**
       * @param dateString {string} string that can be converted to a Date
       * @returns {Date} JavaScript Date object created from the provided dateString
       */
      $mdDateLocaleProvider.parseDate = function(dateString) {
        var m = moment(dateString, 'DD/MM/YYYY', true);
        return m.isValid() ? m.toDate() : new Date(NaN);
      };
  
      /**
       * Check if the date string is complete enough to parse. This avoids calls to parseDate
       * when the user has only typed in the first digit or two of the date.
       * Allow only a day and month to be specified.
       * @param dateString {string} date string to evaluate for parsing
       * @returns {boolean} true if the date string is complete enough to be parsed
       */
      $mdDateLocaleProvider.isDateComplete = function(dateString) {
        dateString = dateString.trim();
        // Look for two chunks of content (either numbers or text) separated by delimiters.
        var re = /^(([a-zA-Z]{3,}|[0-9]{1,4})([ .,]+|[/-]))([a-zA-Z]{3,}|[0-9]{1,4})/;
        return re.test(dateString);
      };

}]).run(["$rootScope", "$compile", "$http", "$templateCache", "WAI", "Usuario", "$state", "Callbacks", function ($rootScope, $compile, $http, $templateCache, WAI, Usuario, $state, Callbacks) {

    var blankScope = $rootScope.$new();

    Callbacks.rootScopeInit.apply(this, arguments);

    //$rootScope.WAI = WAI;


    //Preload templates
    let templates_preload = [
        "assets/views/layout.html",
        "assets/views/aside.html",
        "assets/views/content.html",
        
        "assets/views/partials/aside.nav.uikit.html",
        //"assets/views/partials/aside.setting.html",
        "assets/views/partials/aside.tpl.user.html",

        //"assets/views/gestion/atender.html",
        //"assets/views/gestion/consultas.html",
        "assets/views/gestion/movimientos.html",
        "assets/views/gestion/nuevo.html",
        
        "assets/views/gestion/layout.html",
    ];

    templates_preload.forEach(file => $http.get(file, { cache: $templateCache }));

    //Add clas to body if mobile
    const mobileAndTabletcheck = function() {
        var check = false;
        (function(a){if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino|android|ipad|playbook|silk/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4))) check = true;})(navigator.userAgent||navigator.vendor||window.opera);
        return check;
      };

    //if(window.orientation !==) $("body").addClass("is-mobile");


    //Language
    moment.locale("es");
    
    var cellFilter = {
        body: function ( data, row, column, node, fee ) {    
            var exportContent = $(node).find(".export-content");
            return exportContent.length ? exportContent.text() : $(node).text();
        }
    };
    
    var oldExportAction = function (self, e, dt, button, config) {
        if (button[0].className.indexOf('buttons-excel') >= 0) {
            if ($.fn.dataTable.ext.buttons.excelHtml5.available(dt, config)) {
                $.fn.dataTable.ext.buttons.excelHtml5.action.call(self, e, dt, button, config);
            }
            else {
                $.fn.dataTable.ext.buttons.excelFlash.action.call(self, e, dt, button, config);
            }
        } else if (button[0].className.indexOf('buttons-pdf') >= 0) {
            $.fn.dataTable.ext.buttons.pdfHtml5.action.call(self, e, dt, button, config);
        } else if (button[0].className.indexOf('buttons-print') >= 0) {
            $.fn.dataTable.ext.buttons.print.action(e, dt, button, config);
        } else if (button[0].className.indexOf('buttons-copy') >= 0) {
            //$$("$.fn.dataTable.ext.buttons.copyHtml5", $.fn.dataTable.ext.buttons);
            $.fn.dataTable.ext.buttons.copyHtml5.action.call(self, e, dt, button, config);
            //$.fn.dataTable.ext.buttons.copy.action.call(self,e, dt, button, config);
        }
    };
    
    var newExportAction = function (e, dt, button, config) {
        var self = this, settings = dt.settings()[0];
    
        var oldStart = settings._iDisplayStart, isServerSide = !!settings.oInit.bServerSide;
    
        //No ajax?
        if(!isServerSide) return oldExportAction(self, e, dt, button, config);
    
        dt.one('preXhr', function (e, s, data) {
            // Just this once, load all data from the server...
            data.start = 0;
            data.length = -1;
    
            dt.one('preDraw', function (e, settings) {
                // Call the original action function 
                oldExportAction(self, e, dt, button, config);
    
                dt.one('preXhr', function (e, s, data) {
                    // DataTables thinks the first item displayed is index 0, but we're not drawing that.
                    // Set the property to what it was before exporting.
                    settings._iDisplayStart = oldStart;
                    data.start = oldStart;
                });
    
                // Reload the grid with the original page. Otherwise, API functions like table.cell(this) don't work properly.
                setTimeout(dt.ajax.reload, 0);
    
                // Prevent rendering of the full data to the DOM
                return false;
            });
        });
    
        // Requery the server with the new one-time export settings
        dt.ajax.reload();
    };
    
    var DTdefaultButtons = [
        {
            extend: 'copy',
            exportOptions: {
                columns: '.cell-export',
                format: cellFilter
            },
            text: '<span title="Copiar página activa"><i class="fa fa-copy"></i> Copiar</span>',
            //action: newExportAction
        },
        {
            extend: 'print',
            orientation:  'landscape',
            pageSize:  'A4',
            exportOptions: {
                columns: '.cell-export',
                format: cellFilter
            },
            text: '<span title="Imprimir todos los resultados"><i class="fa fa-print"></i> Imprimir</span>',
            action: newExportAction
        },
        {
            extend: 'pdf',
            orientation:  'landscape',
            pageSize:  'A4',
            customize: function ( doc ) {

                doc.defaultStyle.fontSize = 5;
                doc.styles.tableHeader.fillColor = "#3a5cff";
                doc.styles.tableHeader.fontSize = 8;
                doc.styles.title.alignment = "left";

                var filter_title = $("#filter_title").val();

                if(filter_title){

                    doc.content.splice( 1, 0, {
                        margin: [ 0, 0, 0, 12 ],
                        alignment: 'left',
                        text: filter_title,
                        style: 'title',
                       
                    } );
                }
   
            },
            
            exportOptions: {
                columns: '.cell-export',
                format: cellFilter
            },
            text: '<i class="fa fa-file-pdf-o"></i> PDF',
            action: newExportAction
        },
        {
            extend: 'excel',
            customize: function ( xlsx , a, foo) {

                var filter_title = $("#filter_title").val();

                if(filter_title){
 
                    var sheet = xlsx.xl.worksheets['sheet1.xml'];
                    var numrows = 2;
                    var clR = $('row', sheet);
     
                    //update Row
                    clR.each(function () {
                        var attr = $(this).attr('r');
                        var ind = parseInt(attr);
                        ind = ind + numrows;
                        $(this).attr("r", ind);
                    });
     
                    // Create row before data
                    $('row c ', sheet).each(function () {
                        var attr = $(this).attr('r');
                        var pre = attr.substring(0, 1);
                        var ind = parseInt(attr.substring(1, attr.length));
                        ind = ind + numrows;
                        $(this).attr("r", pre + ind);
                        
                    });
        
                    //insert
                    var r1 = Addrow(1, [{ key: 'A', value: filter_title }]);
                    
                    sheet.childNodes[0].childNodes[1].innerHTML = r1 + sheet.childNodes[0].childNodes[1].innerHTML;

                    $('row', sheet).eq(0).attr("ht", filter_title.split("\n").length * 20).attr("customHeight", 1);

                
                }

                function Addrow(index, data) {
                  var msg = '<row r="' + index + '">';
                    for (var i = 0; i < data.length; i++) {
                        var key = data[i].key;
                        var value = data[i].value;
                        
                        msg += '<c t="str" s="20" r="' + key + index + '">';
                        msg += '<is>';
                        msg += '<t>' + value + '</t>';
                        msg += '</is>';
                        msg += '</c>';
                    }
                    msg += '</row>';
                    return msg;
                }

   
            },
            exportOptions: {
                columns: '.cell-export',
                format: cellFilter,
            },
            text: '<span title="Exportar todos los resultados a Excel"><i class="fa fa-file-excel-o"></i> Excel</span>',
            action: newExportAction
        }
    ];


    $.extend(true, $.fn.dataTable.defaults, {
        "language": {
            "url": "./assets/js/i18n/datatable.js"
        },
        "responsive": true,
        "processing": true,
        "serverSide": true,
        "iDisplayLength": 100,
        "aLengthMenu": [[10, 50, 100, 200], [10, 50, 100, 200]],
        "autoWidth": false,
        "stateSave": false,
        "bDestroy": true,
        "order": [[0, 'DESC']],
        "buttons": DTdefaultButtons,
        language: {
            buttons: {
                copyTitle: 'Copiar a portapapeles',
                copyKeys: 'Presione <i>ctrl</i> o <i>⌘</i> + <i>C</i> para copiar los datos de la tabla<br>a tu portapapeles.<br><br>Para cancelar, haz clic en este mensaje o presione ESCAPE.',
                copySuccess: {
                    _: '%d filas han sido copiadas',
                    1: 'Se copió una fila'
                }
            },
            "decimal":        "",
            "emptyTable":     "No hay datos",
            "info":           "Mostrando _START_ al _END_ de _TOTAL_ registros",
            "infoEmpty":      "Mostrando 0 a 0 de 0 registros",
            "infoFiltered":   "(filtrado de un total de _MAX_ registros)",
            "infoPostFix":    "",
            "thousands":      ",",
            "lengthMenu":     "Ver _MENU_ registros",
            "loadingRecords": "Cargando...",
            "processing":     "Cargando...",
            "search":         "Buscar:",
            "zeroRecords":    "No se encontraron resultados",
            "paginate": {
                "first":      "Inicio",
                "last":       "Fin",
                "next":       "Siguiente",
                "previous":   "Anterior"
            },
            "aria": {
                "sortAscending":  ": activate to sort column ascending",
                "sortDescending": ": activate to sort column descending"
            }
        
        },
        "bDeferRender": true,
        //"dom": "Blfrtip",
        "dom":
        //"<'row'<'col-sm-4'f><'col-sm-4'l><'col-sm-4'B>>" +
        "<'row'<'col-sm-3 col-md-3 col-lg-4'f><'col-sm-3 col-md-3 col-lg-4'l><'col-sm-6 col-md-6 col-lg-4'B>>" +
		"<'row'<'col-sm-12'tr>>" +
		"<'row'<'col-sm-6'i><'col-sm-6'p>>",
	    "renderer": 'bootstrap',
        "drawCallback": function(){
            $('.paginate_button.previous').html('<md-button class="md-primary "><md-icon>keyboard_arrow_left</md-icon></md-button>');
            $('.paginate_button.next').html('<md-button class="md-primary "><md-icon>keyboard_arrow_right</md-icon></md-button>');

            $compile($('.paginate_button'))(blankScope);
        },
        "initComplete": function () {
          

            //Botones exportar
            $('.dt-buttons .dt-button').each(function(index){
                var el = $(this);
                $('.dt-buttons').append('<md-button class="md-primary" ng-click="$root.dtExportButtonCallback('+index+')">' + $(el).html() +'</md-button>');
            });

            $compile($('.dt-buttons'))(blankScope);

            //Input buscar
            $(".dataTables_filter").append(`
                <div layout="row">
                    <md-input-container flex="100">
                        <label>Buscar</label>
                        <md-icon>search</md-icon>
                        <input type="text" ng-change="$root.dtInputSearchCallback(busqueda)" ng-model="busqueda" /> 
                    </md-input-container>
                </div>
            `);

            $compile($('.dataTables_filter'))(blankScope);

            //Select limite
            let options = [];
            $("[name='lista_length'] option").each(function(){
                var el = $(this);
                options.push(`<md-option value="${el.val()}">${el.text()}</md-option>`);
            });
            
            $(".dataTables_length").append(`
                <div layout="row" ng-init="limite = 100">
                    <md-input-container flex="100">
                        <label>Mostrar</label>
                        <md-icon>list</md-icon>
                        <md-select ng-change="$root.dtSelectLimitCallback(limite)" ng-model="limite"> 
                            ${options.join("")}
                        </md-select>
                    </md-input-container>
                </div>
            `);

            $compile($('.dataTables_length'))(blankScope);

        }
        //"dom"				: '<"datatable-header"fl><"datatable-body"t><"datatable-footer"ip>',
    });
    
    $rootScope.dtExportButtonCallback = (index) => setTimeout( a => $('.dt-button').eq(index).trigger("click"), 0);
    $rootScope.dtInputSearchCallback = (value) => setTimeout( a => $('.dataTables_filter input').val(value).trigger("keyup"), 0);
    $rootScope.dtSelectLimitCallback = (value) => setTimeout( a => $('.dataTables_length select').val(value).trigger("change"), 0);
    
    $rootScope.$on( '$stateChangeStart', function(e, toState  , toParams, fromState, fromParams) {

        if(toState.name === "sesion.login"){
            if(Usuario.is_login){
                e.preventDefault(); 
                $state.go("administracion.usuarios");
            }
            return;
        }

        if(!Usuario.is_login) {
            e.preventDefault(); // stop current execution
           return $state.go('sesion.login'); // go to login
        }
    });

    $rootScope.$on('$viewContentLoaded', function () {
        location.hostname === "localhost" && $templateCache.removeAll();
    });


}]);

"serviceWorker" in navigator && "localhost" !== location.hostname && navigator.serviceWorker.register("/sw.js").then(function(e) {
	console.log("Registro de SW exitoso", e)
}).catch(function(e) {
	console.warn("Error al tratar de registrar el sw", e)
})