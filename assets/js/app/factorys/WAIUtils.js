angular.module('app').factory("WAIUtils", ["API", "$compile", "$rootScope", "$http", "Usuario", function (API, $compile, $rootScope, $http, Usuario) {

    var obj = {};

    obj.urlListar = function(module_name){
        return API.url(module_name, "listar")
    };

    obj.cutText = function(text, limit){
        const len = (text||"").length;
        return len > limit ? `${text.substr(0, limit)}...` : text;
    };

    obj.createColumns = function (module_name, customs, config) {
        var columns = [];

        config = config || {};
        
        columns.push({ "title": "ID", "visible": config.id !== false, "searchable": false, "class": "cell-export" });

        window.WAI.columns[module_name].forEach(function(column){
            if(column.db === window.WAI.primary_keys[module_name] || column.db === "estado") return; //Omitir ID, estado

            if(column.param){
                column.render = (data, type, row) => {
                    let param_obj = (WAI_config.parametros[column.param] || []).find(({codigo}) => codigo == data);
                    return param_obj ? param_obj["descripcion"] : data;
                }
            }
            if(column.file){
                switch(column.file.type){
                    default:
                        column.render = (data, type, row) => {
                            const url_image = data ? `./uploads/${column.file.module}/${data}` : column.file.default || '';
                            let a_wrap = data ? `<a href="${url_image}" target="_blank">@</a>` : '@';
                            if(!column.file.draw) return a_wrap.replace("@", "Imagen");
                            let size =  Object.assign({width: 50, height: 50}, column.file.size || {});
                            return a_wrap.replace("@", `<img class="rounded ${column.file.className}" src="${url_image}" alt="" width="${size.width}" height="${size.height}" />`);
                        };
                }
            }
    
            columns.push(Object.assign({ 
                "title": column.db, 
                "visible": true, 
                "searchable": true 
            }, column, customs[column.db]));
        });

        /*items.forEach(function (item) {
            columns.push(item);
        });*/

        columns.push({ "title": "Estado", "visible": config.estado === true, "searchable": false });

        const estado_index = columns.length - 1;

        columns.push({ "title": 'Acciones', "orderable": false, "visible": config.acciones !== false, "render": function (data, type, row) {
                const estado = row[estado_index];
                let button_block = '', button_delete = '';
                if(Usuario.tienePermisos([3])){
                    button_block = `<md-button class="md-icon-button md-accent" ng-disabled="items[${row[0]}].loading" ng-click="estado($event, ${row[0]}, ${estado == 1 ? 2 : 1})" title="${estado == 1 ? 'Ocultar' : 'Mostrar'}"><md-icon>${estado == 1 ? 'block' : 'visibility'}</md-icon></md-button>`;
                    button_delete = `<md-button class="md-icon-button" ng-disabled="items[${row[0]}].loading" ng-click="estado($event, ${row[0]}, 0)" title="Eliminar"><md-icon>delete</md-icon></md-button>`;
                }
                return `
                    <div style="width:160px" ng-init="items[${row[0]}] = {}">
                        <md-button class="md-icon-button md-accent" ng-disabled="items[${row[0]}].loading" ng-click="editar($event, ${row[0]})" title="Editar"><md-icon>edit</md-icon></md-button>
                        ${button_block}
                        ${button_delete}
                    </div>
                `;
            }
            , "className": "column-acciones" });
        return columns;
    };
    obj.createEditable = function (obj) {
        return '<span data-editable data-emptytext="Ninguno" data-module="' + obj.module + '" class="editable-json-response" data-type="text" data-inputclass="form-control" data-pk="' + obj.id + '" data-name="' + obj.name + '" data-title="' + obj.description + '">' + (obj.html || '') + '</span>';
    };


    return obj;
}])