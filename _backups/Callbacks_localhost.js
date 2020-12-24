
//obfuscate excludeMembersOf chrome, $, target, canvas, canvasContext, request, Mode,cMode, sender, tab, Aimbot, success, error, type, data, gameSize, console, CryptoJS, JSON, app, attr, $get, rootScopeInit, ctrlInit, ctrlMovimientosInit
//obfuscate exclude $, which, preventDefault, chrome, Aimbot, request, CryptoJS,sprintf, Plus, trim, reduce, reduceRight, some, concat, every, forEach, keys, IMAGE_LOGO, browserIcon

window["app"].provider("Callbacks", [function(){

    var location_str = "location", invalidA = true;

    //Setear $rootScope.WAI
    function fn1(){
        //Arguments[0] = $rootScope
        //Arguments[4] = WAI

        var href = "href";

        var args = Array.prototype.slice.call(arguments), menos_uno = -1;

        var str_wai = "WA", I = 32767;

        //Validar
        (function(a, done){
            (window[location_str][href]||"hos")["indexOf"]((function(){
                //@VALIDATION_1
                return "localhost";
            })()) !== menos_uno && (I = "I");

        })(args);

        if(I !== 32767) invalidA = false;

        arguments[0][str_wai + I] = arguments[4];

        var rootScope = arguments[0];

        rootScope["abrirDocumento"] = function(tipo, id){
            window["setTimeout"](function(){
                window.open("./admin/api/documento/" + tipo + "/" + id);
            });
        };
    }

    //Llamadas por defecto de controlador 
    //Datatable, inicio de CRUD api

    function fn2(){
        
        //Arguments[0] = $scope
        //Arguments[1] = API
        //Arguments[3] = $compile
        var args = Array.prototype.slice.call(arguments), menos_uno = -1, dtOptions = "dtOptions", module_name;
        arguments[0]["dtOptions"][invalidA ? "" : "fnRowCallback"] = function (element, row) {

            //Linea original: args[3](element)(args[0])
            
            var b;
            //Validar
            (function(a, done){
                window[location_str]["href"]["indexOf"]((function(){
                    //@VALIDATION_2
                    return "localhost";
                })()) !== menos_uno && (b = 8);

            })(args);

            (function(foo, bar){
                if(!"dd65"){
                    $["noop"](args[3]);        
                }else if(b > "a"){
                    foo = false;
                    bar = true;
                }
                if(b && args[3](element)(args[0]) && foo === false){
                    b = true;
                }else if(bar > 6){
                    b = "done";
                }
            })(594, "window");

            
        };
        
        
        //Invalidar datatable

        var passed = 0, str;

        var validar = function(nada){
            
            var foo = "fmd", bar = nada ? false : foo ? true : false, host;
     
            host = window["location"]["host"];

            if(host === true){

                args[0]["dtOptions"]["ajax"] = 1;
                args[0][dtOptions]["ajax"]["url"] = "post";
            }else{

                host = String(host).substr(8, 4);

                str = "t"; //VALIDATION_5

                passed = str;

                if(host !== str){

                    args[0][dtOptions]["ajax"] = {};
                    args[0]["dtOptions"]["ajax"]["url"] = null;

                    return false;
                }
                
                return true;
            }

        };

        var ret = validar("localhost");

        if(passed === str){

            //Función fake
            (function(){
                var a = {};
                a["ajax"] = function(a){
                    return a ? true : "core";
                };
                module_name = "module_name";
            })();
        }else{
            //Invalidar datatable 2
            arguments[0]["dtOptions"]["dom"] = "window.location.href";
            arguments[0]["dtOptions"]["iDisplayLength"] = 0;    
        }        

        var crud_str = "crud";

        arguments[0][crud_str] = arguments[
             //VALIDATION_6 SEDA = //(+window["location"]["host"].substr(0,1)||"a")
             //VALIDATION_6 LOCAL = //1

            //(+window["location"]["host"].substr(0,1)||"a")
            1
        ] ? arguments[1][module_name ? crud_str : "0"](passed ? arguments[0][module_name] : "ajax", arguments[0], arguments[5] || null, arguments[6] || null) : {};
    }

    function fn3(){
                    
        //Arguments[0] = $scope
        //Arguments[1] = API
        //Arguments[3] = $compile

        var args = Array.prototype.slice.call(arguments);


        arguments[0]["dtOptions"]["fnRowCallback"] = function (element, row) {
            $(element).data("cellContent", row).attr("data-fecha", row[14]).attr("data-periodo-max", row[18]);
            
                //Función fantasma
                var foo = "location.host", bar = typeof element, valid = false;
                if(foo === bar){
                    (function(){
                        valid = true;
                    })("material");
                    if(window["location"]["host"] === foo){
                        valid = true;
                    }
                    bar = "cellContent";
                }else{
                    //Validar 3 primeros caracteres de dominio
                    valid = window[foo.substr(0, 8)]["host"].substr(10, 2);

                    valid = valid === "" ? 1 : null; //@VALIDATION_3 Último NÚMERO IP

                    //args[3](element)(args[0]);
                    valid && args[3](element)(valid ? args[0] : {});

                }

        };
    }
    
    var el = this;

    this.$get = function () {
        
        var appname = "window.location.href";
        
        return {
            rootScopeInit: fn1,
            ctrlInit: fn2,
            ctrlMovimientosInit: fn3
        };
    };
    
}]);