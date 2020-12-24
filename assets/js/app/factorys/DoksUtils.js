angular.module('app').factory("DoksUtils", ["API", "$compile", "$rootScope", "$http", function (API, $compile, $rootScope, $http) {

    var obj = {};

    obj.urlListar = function(module_name){
        return API.url(module_name, "listar")
    };

    obj.createColumns = function (module_name, customs, config) {
        var columns = [];

        config = config || {};
        
        columns.push({ "title": "ID", "visible": config.id !== false, "searchable": false, "class": "cell-export" });

        window.WAI.columns[module_name].forEach(function(column){

            if(column.db === window.WAI.primary_keys[module_name] || column.db === "estado") return; //Omitir ID, estado

            let newObj = Object.assign({ 
                "title": column.db, 
                "visible": true, 
                "searchable": true 
            }, column, customs[column.db]); 
            
            if(column.param && column.param in WAI_config.parametros){
                newObj.render = (data, type, row) => {
                    var paramObj = WAI_config.parametros[column.param].find(({codigo}) => codigo == data);
                    return paramObj ? column.param_set ? paramObj[column.param_set] : paramObj["descripcion"] : data;
                };
            }
            
            columns.push(newObj);
        });

        /*items.forEach(function (item) {
            columns.push(item);
        });*/

        columns.push({ "title": "Estado", "visible": config.estado === true, "searchable": false});
        /*columns.push({ "title": '<i class="icon-menu8"></i>', "width": "1%", "orderable": false, "visible": config.acciones !== false, "render": function (data, type, row) {
                return ''
            }
        });*/
        return columns;
    };
    obj.createEditable = function (obj) {
        return '<span data-editable data-emptytext="Ninguno" data-module="' + obj.module + '" class="editable-json-response" data-type="text" data-inputclass="form-control" data-pk="' + obj.id + '" data-name="' + obj.name + '" data-title="' + obj.description + '">' + (obj.html || '') + '</span>';
    };


    return obj;
}])