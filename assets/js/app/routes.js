app.config(["$stateProvider",  "CollectionProvider", function ($stateProvider, CollectionProvider) {

    //$locationProvider.html5Mode(true);
    
    $stateProvider.state("sesion", {
        url: "/sesion",
        template: '<div class="bg-big" flex layout-fill><div ui-view class="fade-in-down smooth" flex layout-fill></div></div>'
    }).state("sesion.login", {
        url: "/login",
        templateUrl: "assets/views/pages/signin.html",
        controller: "SesionCtrl"
    }).state("access.signup", {
        url: "/signup",
        templateUrl: "assets/views/pages/signup.html"
    }).state("access.forgot-password", {
        url: "/forgot-password",
        templateUrl: "assets/views/pages/forgot-password.html"
    }).state("access.lockme", {
        url: "/lockme",
        templateUrl: "assets/views/pages/lockme.html"
    });

    $stateProvider.state("usuario", {
        url: "/usuario",
        views: {
            "": {
                templateUrl: "assets/views/layout.html"
            },
            aside: {
                templateUrl: "assets/views/aside.html"
            },
            content: {
                templateUrl: "assets/views/content.html"
            }
        }
    }).state("usuario.configuracion", {
        url: "/configuracion",
        controller: "UsuarioConfiguracionCtrl",
        templateUrl: "assets/views/pages/usuario-configuracion.html",
        data: {
            title: "Configuración de Usuario",
            /*theme: {
                primary: "blue-grey"
            }*/
        },
        resolve: {
            UbigeoDepartamentos: ["$http", "API", "WAI", "$q", function($http, API, WAI, $q){
                let defer = $q.defer();
                $http.get(API.url("Ubigeo", "departamentos")).success((data) => defer.resolve(data));
                return defer.promise;
            }]
       }
    });

    $stateProvider.state("configuracion", {
        "abstract": true,
        url: "/configuracion",
        views: {
            "": {
                templateUrl: "assets/views/layout.html"
            },
            aside: {
                templateUrl: "assets/views/aside.html"
            },
            content: {
                templateUrl: "assets/views/content.html"
            }
        }
    }).state("configuracion.categorias", {
        url: "/categorias",
        templateUrl: "assets/views/pages/varios/listar.html",
        data: {
            title: "Categorías"
        },
        controller: 'CategoriasCtrl'
    }).state("configuracion.servicios", {
        url: "/servicios",
        templateUrl: "assets/views/pages/varios/listar.html",
        data: {
            title: "Servicios"
        },
        controller: 'ServiciosCtrl'
    }).state("configuracion.unidad_medida", {
        url: "/unidad-medida",
        templateUrl: "assets/views/pages/varios/listar.html",
        data: {
            title: "Uhidad Medida"
        },
        controller: 'UnidadMedidaCtrl'
    }).state("configuracion.general", {
        url: "/general",
        templateUrl: "assets/views/pages/configurarion-general.html",
        controller: "ConfiguracionGeneralCtrl",
        data: {
            title: "Configuración General",
            theme: {
                primary: "blue-grey"
            }
        },
        resolve: {
            Info: ["$http", "API", "WAI", "$q", function($http, API, WAI, $q){
                let defer = $q.defer();
                $http.get(API.url("configuracion", "info")).success((data) => defer.resolve(data));
                return defer.promise;
            }]
       }
    }).state("configuracion.transporte", {
        url: "/transporte",
        templateUrl: "assets/views/pages/varios/listar.html",
        data: {
            title: "Transporte"
        },
        controller: 'TransporteCtrl'
    }).state("configuracion.estado_envio", {
        url: "/estado-envio",
        templateUrl: "assets/views/pages/varios/listar.html",
        data: {
            title: "Estados de envío"
        },
        controller: 'EstadoEnvioCtrl'
    });

    $stateProvider.state("administracion", {
        "abstract": true,
        url: "/administracion",
        views: {
            "": {
                templateUrl: "assets/views/layout.html"
            },
            aside: {
                templateUrl: "assets/views/aside.html"
            },
            content: {
                templateUrl: "assets/views/content.html"
            }
        }
    }).state("administracion.periodos", {
        url: "/periodos",
        templateUrl: "assets/views/pages/varios/listar.html",
        data: {
            title: "Periodos"
        },
        controller: 'PeriodosCtrl',
        resolve: {
            Collection: CollectionProvider.create(["libros", "bloques"])
        }
    }).state("administracion.proveedores", {
        url: "/proveedores",
        templateUrl: "assets/views/pages/varios/listar.html",
        data: {
            title: "Proveedores"
        },
        controller: 'ProveedorCtrl'
    }).state("administracion.usuarios", {
        url: "/usuarios",
        templateUrl: "assets/views/pages/varios/listar.html",
        data: {
            title: "Usuarios"
        },
        controller: 'UsuariosCtrl'
    });

    $stateProvider.state("app.sedes", {
        url: "/sedes",
        templateUrl: "assets/views/pages/varios/listar.html",
        data: {
            title: "Sedes"
        },
        controller: 'SedesCtrl'
    }).state("app.acciones", {
        url: "/acciones",
        templateUrl: "assets/views/pages/varios/listar.html",
        data: {
            title: "Acciones - Denominaciones"
        },
        controller: 'AccionesCtrl'
    });

    $stateProvider.state("homeschool", {
        "abstract": true,
        url: "/vitaschool",
        views: {
            "": {
                templateUrl: "assets/views/layout.html"
            },
            aside: {
                templateUrl: "assets/views/aside.html"
            },
            content: {
                templateUrl: "assets/views/content.html"
            }
        },
        resolve: {
            Usuarios: ["API", "$q", "$http", function(API, $q, $http){
                let url = API.url("crud", "usuarios");
                let defer = $q.defer();
                $http.get(url).success(data => defer.resolve(data));
                return defer.promise;
            }],
            Info: [function(){
                return {}
            }]
        }
    }).state("homeschool.tracking", {
        url: "/tracking",
       templateUrl: "assets/views/gestion/layout.html",
       controller: 'TrackingCtrl',
    }).state("homeschool.tracking.nuevo", {
        url: "/nuevo",
        data: {
            title: "Nuevo Rastreo",
            folded: false
        },
        views: {
            'nuevo': {
                templateUrl: "assets/views/gestion/nuevo.html",
                controller: 'TrackingNuevoCtrl'
            }
        },
        resolve: {

        },
    
    }).state("homeschool.tracking.envios", {
        url: "/envios",
        data: {
            title: "Nuevo Envío",
            folded: false
        },
        views: {
            'envios': {
                templateUrl: "assets/views/gestion/envios.html",
                controller: 'TrackingEnviosCtrl'
            }
        },
        resolve: {
            /*ListaProductos: ["API", "$q", "$http", function(API, $q, $http){
                let url = API.url("tracking", "lista_productos");
                let defer = $q.defer();
                $http.get(url).success(data => defer.resolve(data));
                return defer.promise;
            }]*/
        },
        
        //vista previa antes checklist, mostrar fecha de movimientos
        
    }).state("homeschool.tracking.listado", {
        url: "/listado",
        data: {
            title: "Nuevo Envío",
            folded: false
        },
        views: {
            'listado': {
                templateUrl: "assets/views/gestion/listado.html",
                controller: 'TrackingListadoCtrl'
            }
        },
        resolve: {
            Periodos: ["API", "$q", "$http", function(API, $q, $http){
                let url = API.url("crud", "periodos");
                let defer = $q.defer();
                $http.get(url).success(data => defer.resolve(data));
                return defer.promise;
            }],
            PeriodosDetalles: ["API", "$q", "$http", function(API, $q, $http){
                let url = API.url("crud", "periodos_detalles");
                let defer = $q.defer();
                $http.get(url).success(data => defer.resolve(data));
                return defer.promise;
            }],
            PeriodosMatriculas: ["API", "$q", "$http", function(API, $q, $http){
                let url = API.url("crud", "periodos_matriculas");
                let defer = $q.defer();
                $http.get(url).success(data => defer.resolve(data));
                return defer.promise;
            }],
            PeriodosDetallesTareas: ["API", "$q", "$http", function(API, $q, $http){
                let url = API.url("crud", "periodos_detalles_tareas");
                let defer = $q.defer();
                $http.get(url).success(data => defer.resolve(data));
                return defer.promise;
            }],
            /*ListaProductos: ["API", "$q", "$http", function(API, $q, $http){
                let url = API.url("tracking", "lista_productos");
                let defer = $q.defer();
                $http.get(url).success(data => defer.resolve(data));
                return defer.promise;
            }]*/
        },
        
    }).state("homeschool.clientes", {
        url: "/estudiantes",
        templateUrl: "assets/views/pages/varios/listar.html",
        data: {
            title: "Estudiantes"
        },
        controller: 'ClientesCtrl'
    }).state("homeschool.asignaciones", {
        url: "/asignaciones",
        templateUrl: "assets/views/pages/varios/listar.html",
        data: {
            title: "Asignaciones"
        },
        controller: 'PeriodosMatriculasCtrl'
    }).state("homeschool.periodos_detalles_tareas", {
        url: "/tareas",
        templateUrl: "assets/views/pages/varios/listar.html",
        data: {
            title: "Tareas"
        },
        controller: 'PeriodosDetallesTareasCtrl'
    }).state("homeschool.libros", {
        url: "/proyectos",
        templateUrl: "assets/views/pages/varios/listar.html",
        data: {
            title: "Proyectos"
        },
        controller: 'LibrosCtrl'
    }).state("homeschool.bloques", {
        url: "/bloques",
        templateUrl: "assets/views/pages/varios/listar.html",
        data: {
            title: "Bloques"
        },
        controller: 'BloquesCtrl'
    }).state("homeschool.matriculas", {
        url: "/matriculas",
        templateUrl: "assets/views/pages/varios/listar.html",
        data: {
            title: "Matriculas"
        },
        controller: 'MatriculasCtrl'
    })

}])