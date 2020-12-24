
window.HOMESCHOOL = angular.module('WAI', ["ngMaterial", "ngMessages", "ui.router", "ui.router.state.events", "dndLists", "angularMoment", "ngFileUpload"]);
window.HOMESCHOOL.constant("KEYCODES", WAI.keycodes);
window.HOMESCHOOL.config(["$stateProvider", "$urlRouterProvider", "$locationProvider", "$mdThemingProvider", function($stateProvider, $urlRouterProvider, $locationProvider, $mdThemingProvider){
	
	/*var customBlueMap = 		$mdThemingProvider.extendPalette('light-blue', {
		'contrastDefaultColor': 'light',
		'contrastDarkColors': ['50'],
		'50': 'ffffff'
	  });
	  $mdThemingProvider.definePalette('customBlue', customBlueMap);
	  $mdThemingProvider.theme('default')
		.primaryPalette('customBlue', {
		  'default': '500',
		  'hue-1': '50'
		})
		.accentPalette('pink');

	  $mdThemingProvider.theme('input', 'default')
			.primaryPalette('grey')*/

			    
  $mdThemingProvider.theme('default')
  .primaryPalette('purple')
  .accentPalette('teal')
  .warnPalette('deep-orange')
  .backgroundPalette('grey');

	//$locationProvider.html5Mode(true);

	// For any unmatched url, send to /route1
	$urlRouterProvider.otherwise("/");
	$urlRouterProvider.when("/homeschool","/homeschool/mis-libros");
	
	$stateProvider
		.state('index', {
			url: "/",
			abstract: true,
			templateUrl: "./assets/wai/views/index.html?" + WAI.assets_version,
			controller: "IndexCtrl",
			resolve: {

				Categorias: ["$q", function($q){
					let defer = $q.defer();
					defer.resolve(UTILS.itemsCollectionToObject(WAI.collections.categorias, "categorias"));
					return defer.promise;
				}]
			}
		}).state('index.inicio', {
			url: "",
			abstract: true,
			templateUrl: "./assets/wai/views/inicio.html?" + WAI.assets_version,

		}).state('index.aleatorio', {
			url: "",
			abstract: true,
			controller: "AleatorioCtrl"

		}).state('index.inicio.intro', {
			url: "",
			templateUrl: "./assets/wai/views/selector.html?" + WAI.assets_version,
			data: {
				title: 'Bienvenido'
			}
		}).state('index.salir', {
			url: "salir",
			resolve: {
				Request: ["$q", "$stateParams", "$http", function($q, $stateParams, $http){
					return $http.post("./main/salir", {});
				}],
			},
			controller: ["Request", "$state", function(Request, $state){
				if(Request.data && Request.data.ok) location.href = "./";
				else $state.go("index.inicio");
			}]
		}).state('index.cuenta', {
			url: "cuenta?{payment}",
			templateUrl: "./assets/wai/views/cuenta.html?" + WAI.assets_version,
			controller: "CuentaCtrl",
			data: {
				title: 'Mi Cuenta'
			}
		}).state('index.homeschool', {
			url: "homeschool",
			templateUrl: "./assets/wai/views/homeschool.html?" + WAI.assets_version,
			controller: "HomeSchoolCtrl",
			data: {
				title: 'HomeSchool'
			}, 
			resolve: {
				Libros: ["$q", "$http", function($q, $http){
					return null;
					/*let url = "./admin/api/crud/libros/collection";
					let defer = $q.defer();
					$http.get(url).then(response => defer.resolve(UTILS.itemsCollectionToObject(response.data, "libros")));
					return defer.promise;*/
				}],
				Info: ["$q", "$http", function($q, $http){
					let url = "./main/homeschool?page=info";
					let defer = $q.defer();
					$http.get(url).then(response => defer.resolve(response.data));
					return defer.promise;
				}]
			}
		}).state('index.homeschool.mis_libros', {
			url: "/mis-libros",
			templateUrl: "./assets/wai/views/homeschool/mis-libros.html?" + WAI.assets_version,
			controller: "HomeSchoolMisLibrosCtrl",
			data: {
				title: 'Mis Libros'
			}
		}).state('index.homeschool.inscripcion', {
			url: "/inscripcion",
			templateUrl: "./assets/wai/views/homeschool/inscripcion.html?" + WAI.assets_version,
			controller: "HomeSchoolInscripcionCtrl",
			data: {
				title: 'Inscripción a libros'
			}
		}).state('index.video', {
			url: "video/{seo_url}",
			templateUrl: "./assets/wai/views/video.html?" + WAI.assets_version,
			resolve: {
				Video: ["$q", "$stateParams", "Videos", function($q, $stateParams, Videos){

					let defer = $q.defer(), video = Videos.find(item => item.seo_url == $stateParams.seo_url);
					defer.resolve(video);
					return defer.promise;
				}],
			},
			controller: "VideoCtrl"
		}).state('index.play', {
			url: "play/{seo_url}",
			templateUrl: "./assets/wai/views/play.html?" + WAI.assets_version,
			resolve: {
				Video: ["$q", "$stateParams", "Videos", function($q, $stateParams, Videos){

					let defer = $q.defer(), video = Videos.find(item => item.seo_url == $stateParams.seo_url);
					defer.resolve(video);
					return defer.promise;
				}],
			},
			controller: "PlayCtrl"
		}).state('index.inicio.busqueda', {
			url: "videos/{busqueda}",
			templateUrl: "./assets/wai/views/busqueda.html?" + WAI.assets_version,
			controller: "BusquedaCtrl"
		}).state('index.inicio.crear_cuenta', {
			url: "crear-cuenta",
			templateUrl: "./assets/wai/views/crear-cuenta.html?" + WAI.assets_version,
			controller: "RegistroCtrl",
			data: {
				title: 'Registro de estudiante'
			}
		}).state('index.inicio.login', {
			url: "iniciar-sesion",
			templateUrl: "./assets/wai/views/iniciar-sesion.html?" + WAI.assets_version,
			controller: "IniciarSesionCtrl",
			data: {
				title: 'Iniciar Sesión'
			}
		}).state('index.inicio.preguntas_frecuentes', {
			url: "preguntas-frecuentes",
			templateUrl: "./assets/wai/views/preguntas-frecuentes.html?" + WAI.assets_version,
			controller: "PreguntasFrecuentesCtrl"
		});

}]);

window.HOMESCHOOL.run(["$rootScope", "$state", "$templateCache", "Project", "Usuario", ($rootScope, $state, $templateCache, Project, Usuario) => {
	
	$rootScope.$state = $state;
	console.log("$state", $state.$current.parent);
	
	$rootScope.busqueda = "";

	if(WAI.usuario){
		Usuario.setLogin(WAI.usuario);
	}

	$(document).ready(function(){
		//$(window).on("scroll")
	})

	$rootScope.$on('$stateChangeStart', function(e, toState, toParams, fromState, fromParams){ 
		$('.navbar-collapse').collapse('hide');
	});
	
	$rootScope.$on('$stateChangeSuccess', function(e, toState, toParams, fromState, fromParams){ 
		
		if(!Usuario.is_login 
			&& toState.name !== "index.inicio.crear_cuenta" 
			&& toState.name !== "index.inicio.crear_cuenta"
		){
			e.preventDefault(); 
			$state.go("index.inicio.login");
			return;
		}
		
		/*if((toState.name === "index.inicio" || toState.name === "index.inicio.intro") && !Usuario.is_login){
			e.preventDefault(); 
			$state.go("index.inicio.login");
			return;
		}

		if(toState.name === "index.inicio.login"){
            if(Usuario.is_login){
                e.preventDefault(); 
                $state.go("index.inicio.intro");
            }
            return;
        }else if(toState.name === "index.cuenta"){
            if(!Usuario.is_login){
                e.preventDefault(); 
                $state.go("index.inicio.intro");
            }
            return;
		}*/


	});


	$rootScope.$on('$viewContentLoaded', function () {
        location.hostname === "localhost" && $templateCache.removeAll();
    });
	
}])
.filter('padId', () => (a, b) => (1e8 + "" + a).slice(-(b || 5)))
.service("Project", ["$filter", function($filter){

	var target = this;

	this.institucion = WAI.institucion;


	this.obtenerListado = (categoria, term) => {
		
		let videos = term ? $filter("filter")(target.Videos, term) : target.Videos.filter(item => item.id_categoria == categoria.id_categoria);
		
		let grupos = [{items: []}], item, g = 0, i = 0;
		while(item = videos.shift()){

			grupos[g].items.push(item);
			
			if(i === 3){
				i = -1;
				grupos.push({items: []});
				g++;
			}

			i++;
			
		}

		return grupos;
	};
	
	
}]).service("Usuario", ["$filter", function($filter){

	this.is_login = false;
    this.info = {};
		
    this.setLogin = function(data){
        this.is_login = !!data;
        this.info = this.is_login ? data : {};
    }
    this.setLogout = function(){
        this.is_login = false;
        this.info = {}
    }

    this.tienePermisos = function(roles_arr){
        if(!this.is_login) return false;
        return roles_arr.indexOf(+this.info.rol || 0) !== -1;
	};
	
}]).factory("Notificaciones", ["$mdToast", "$log", function($mdToast, $log){
	return {
		alert: function(title){
			
		$mdToast.show(
			$mdToast.simple()
			.textContent(title)
			.parent("#content")
			//.position(pinTo)
			.hideDelay(3000))
		  .then(function() {
			$log.log('Toast dismissed.');
		  }).catch(function() {
			$log.log('Toast failed or was forced to close early by another toast.');
		  });

		}
	}
}]).directive("homeschool", ["$filter", ($filter) => {

	return {
		template: `<div ui-view layout="row" flex></div>`,
		transclude: true,
		link: (scope, element, attrs) => {

			element.attr("id", "homeschool");

			attrs.$observe("current", (value) => {

			});
						
		}
	}

}]).directive('waiFileModule', ["$compile", "Upload", "$mdToast", "$timeout", function($compile, Upload, $mdToast, $timeout) {
    return {
        restrict: 'A',
        scope: {
            waiFileAccept : '=',
            waiFilePattern: '=',
            waiFileModule: '@',
            waiFileModel: '=?',
            waiFileResize: '=?'
        },
        link: function($scope, element){

        

            let el = $(element), data = el.data(), parent = el.closest("md-input-container");
            parent.addClass('wai-file-wrap');
            
            //'.pdf,.xls,image/*'
            let upload_element = $("<div />").addClass("wai-file");
            upload_element.append(`
            <md-button title="Abrir en nueva ventana" ng-show="!!waiFileModel" class="md-icon-button wai-file-action" ng-click="abrir()"><md-icon>open_in_new</md-icon></md-button>
            <md-button title="Restaurar al valor anterior" ng-if="uploaded" class="md-icon-button wai-file-action" ng-click="restaurar()"><md-icon>settings_backup_restore</md-icon></md-button>
            <md-button ngf-resize="waiFileResize" title="Subir archivo" ng-disabled="(f.progress > 0 && f.progress < 100) || request_loading" class="md-icon-button"  ngf-select="uploadFiles($file, $invalidFiles)"
            accept="{{waiFileAccept}}" ngf-pattern="{{waiFilePattern}}" ng-class="{'uploaded': f.progress == 100} ">
                <md-icon>{{f.progress == 100 ? 'cloud_done' : 'cloud_upload'}}</md-icon> 
            </md-button>
            <b ng-show="f.progress > 0">{{f.progress}}%</b>
            `);

            $scope.request_loading = false;
            $scope.old_value = angular.copy(typeof $scope.waiFileModel !== undefined ? $scope.waiFileModel : undefined);

            $scope.restaurar = () => {
                $scope.waiFileModel = angular.copy($scope.old_value);
                $scope.uploaded = false;
                $scope.f.progress = 0;
            };

            $scope.abrir = () => window.open(
                !/^https?\:/.test($scope.waiFileModel)
                ? `${$("base").attr("href")}uploads/${$scope.waiFileModule}/${$scope.waiFileModel}`
                : $scope.waiFileModel);

            $scope.uploadFiles = function(file, errFiles) {

                $scope.request_loading = true;
                $scope.f = file;

                $scope.errFile = errFiles && errFiles[0];
                if($scope.errFile){
                    $mdToast.show(
                        $mdToast.simple()
                        .textContent(`Error: ${$scope.errFile.$error}`)
                        .hideDelay(2500));
                }
                if (file) {
					
					let url = "./main/upload/tareas";

                    file.upload = Upload.upload({
                        //url: 'https://angular-file-upload-cors-srv.appspot.com/upload',
                        url: url,
                        data: {file: file}
                    });
        
                    file.upload.then(function (response) {
                        $scope.request_loading = false;
                        $timeout(function () {
                            let result = response.data;
                            if(result.error){
                                return $mdToast.show(
                                    $mdToast.simple()
                                    .textContent(`${result.mensaje}`)
                                    .hideDelay(2500));
                            }
                            //if($scope.waiFileModel !== undefined){
                                $scope.waiFileModel = result.upload_data.file_name;
                                $scope.uploaded = true;
                            //}
                        });
                    }, function (response) {
                        $scope.request_loading = false;
                        $mdToast.show(
                            $mdToast.simple()
                            .textContent(`Error: ${response.data}`)
                            .hideDelay(3000));
                    }, function (evt) {
                        file.progress = Math.min(100, parseInt(100.0 * evt.loaded / evt.total));
                    });
                }   
            }

            parent.append(upload_element);

            $compile(upload_element)($scope);
        }
    }
}]).controller('IndexCtrl', ["$rootScope", '$scope', "$state", "Project", "Categorias", "$filter", "Usuario", "$mdBottomSheet", "$mdSidenav", "$mdDialog", function($rootScope, $scope, $state, Project, Categorias, $filter, Usuario, $mdBottomSheet, $mdSidenav, $mdDialog) {

	function shuffle(a) {
		for (let i = a.length - 1; i > 0; i--) {
			const j = Math.floor(Math.random() * (i + 1));
			[a[i], a[j]] = [a[j], a[i]];
		}
		return a;
	}


	$scope.Project = Project;

	$scope.obtenerListado = Project.obtenerListado;

	$scope.usuario = Usuario;
	
	$scope.categorias = Categorias;

	$scope.homeschool = {
		menu: [
			{
			  link : 'index.homeschool.mis_libros',
			  title: 'Mis libros',
			  icon: 'bookmarks'
			},
			{
			  link : 'index.homeschool.inscripcion({param: 2})',
			  title: 'Inscripción a libros',
			  icon: 'playlist_add'
			}
		  ]
	};

	$scope.outschool = {
		menu: [

		  ]
	};


	$scope.toggleSidenav = function(menuId) {
		$mdSidenav(menuId).toggle();
	  };

	  var originatorEv;

	$scope.openMenu = function($mdMenu, ev) {
		originatorEv = ev;
		$mdMenu.open(ev);
	  };

	$scope.buscar = () => {
		//$scope.registro_info.busqueda
		let str = String($rootScope.busqueda || "").trim();
		if(!str.length) return;
		$state.go("index.inicio.busqueda", {busqueda: str});
	};
	

}]).controller("RegistroCtrl", ["$scope", "Project", "$http", function($scope, Project, $http){

	console.log("$scope", $scope)

	$scope.registro_info = {
		tipo_documento: "1",
		usuario: "",
		password: ""
	};

	$scope.loading = false;
	$scope.text_submit = "Registrar";
	$scope.post_response = {ok: false, send: false};

	$scope.submit = () => {

		if($scope.loading) return;

		$scope.loading = true; 
		$scope.text_submit = "Registrando...";

		let post_data = Object.assign({}, $scope.registro_info);

		$http.post("./main/registro", post_data).then(response => {
			if(!response.data) return;
			Object.assign($scope.post_response, response.data);
		}).finally(() => {
			$scope.loading = false;
			$scope.text_submit = "Registrar";
			$scope.post_response.send = true;
		});

		console.log("$scope.registro_info", $scope.registro_info);
	};

}]).controller("IniciarSesionCtrl", ["$scope", "Project", "Usuario", "$http", "$state", function($scope, Project, Usuario, $http, $state){

	$scope.registro_info = {
		usuario: "",
		password: "",
		remember_me: true
	};

	$scope.loading = false;
	$scope.text_submit = "Iniciar sesión";
	$scope.post_response = {ok: false, send: false};
	
	$scope.submit = () => {

		if($scope.loading) return;

		$scope.loading = true; 
		$scope.text_submit = "Iniciando sesión...";

		let post_data = Object.assign({}, $scope.registro_info);

		$http.post("./main/iniciar_sesion", post_data).then(response => {
			if(!response.data) return;
			
			Object.assign($scope.post_response, response.data);

			if(response.data.error) return;

			Usuario.setLogin(response.data.usuario);

			$state.go("index.inicio.intro");

		}).finally(() => {
			$scope.loading = false;
			$scope.text_submit = "Iniciar sesión";
			$scope.post_response.send = true;
		});

	};

}]).controller("PreguntasFrecuentesCtrl", ["$scope", "PreguntasFrecuentes", "Project", function($scope, PreguntasFrecuentes, Project){

	$scope.items = PreguntasFrecuentes;
	console.log("PreguntasFrecuentes", PreguntasFrecuentes);


}]).controller("HomeSchoolCtrl", ["$scope", "Project", "$state", "$stateParams", "Info", function($scope, Project, $state, $stateParams, Info){

	$scope.info = Info;

	$scope.$watchCollection("info.matriculas", () => {
	
		$scope.groups = [];
		
		$scope.info.matriculas.forEach(item => {
			let findGroup = $scope.groups.findIndex(i => i.id_grupo == item.id_periodo);
			if(findGroup === -1) findGroup = $scope.groups.push({id_grupo: item.id_periodo, title: item.nombre_periodo, items: []})  - 1;
			 $scope.groups[findGroup].items.push(item);
		
		});

	})
	
}]).controller("HomeSchoolMisLibrosCtrl", ["$scope", "Project", "$state", "$stateParams", "$mdDialog", "$q", "$http", function($scope, Project, $state, $stateParams, $mdDialog, $q, $http){

	$scope.abrirLibro = (ev, item) => {
		    
        return $mdDialog.show({
            controller: ["$scope", "LibroData", function($scope, LibroData){
				console.log("item", LibroData)
				$scope.item = LibroData.item;
				$scope.tareas = LibroData.tareas;
				$scope.cancel = $mdDialog.cancel;
			}],
			templateUrl: "./assets/wai/views/homeschool/libro.html?" + WAI.assets_version,
            multiple: true,
            targetEvent: ev,
            clickOutsideToClose: false,
            escapeToClose: false,
            fullscreen: true,
            resolve: {
                LibroData: [function(){
					let url = "./main/homeschool?page=libro_data&id_periodo_detalle=" + item.id_periodo_detalle;
					let defer = $q.defer();
					$http.get(url).then(response => defer.resolve(response.data));
					return defer.promise;
               }],

            },
            locals: {
     
            }
        });
	}
	
	
}]).controller("HomeSchoolInscripcionCtrl", ["$scope", "Project", "$state", "$stateParams", "Libros", "Info", "$q", "$http", "Notificaciones", function($scope, Project, $state, $stateParams, Libros, Info, $q, $http, Notificaciones){

	console.log("Libros", Libros);
	console.log("Info", Info);

	$scope.registro_info = {
		periodo: null
	};

	$scope.validaPeriodo = item  => {
		const hoy = Info.fecha_hoy;
		return item.estado == 1 && hoy >= item.fecha_inicio && hoy <= item.fecha_fin
	};

	//Seleccionar último válido
	let max = 0;
	Info.periodos.forEach(item => {
		if($scope.validaPeriodo(item)){
			if(item.id_periodo > max){
				$scope.registro_info.periodo = item;
				max = item.id_periodo;
			}
			
		}
	});

	$scope.seleccionados = {
		label: "Seleccionados",
		allowedTypes: ['foo'],
		max: 0,
		items: []
	};

	$scope.disponibles = {
		label: "Disponibles",
		allowedTypes: ['foo'],
		max: 0,
		items: []
	};
	$scope.cargando_disponibles = false;

	$scope.all_items = [];
	$scope.total_registrar_nuevos = 0;

	function updateListaInscripcion(){
		const ids_my_detalles_matriculas = $scope.info.matriculas.map(item => +item.id_periodo_detalle);
			
		let groups = $scope.all_items.reduce((obj, item) => {
			const group_name = ids_my_detalles_matriculas.indexOf(+item.id_periodo_detalle) === -1 ? 'disponibles' : 'seleccionados';
			item.block = group_name === 'seleccionados';
			obj[group_name].push(item);
			return obj
		}, {disponibles: [], seleccionados: []});

		$scope.disponibles.items = groups.disponibles;
		$scope.disponibles.max = $scope.registro_info.periodo.maximo_libros;

		$scope.seleccionados.items = groups.seleccionados;

	}

	$scope.$watchCollection("seleccionados.items", () => {
		$scope.total_registrar_nuevos = $scope.seleccionados.items.reduce((sum, i) => ((sum += !i.block ? 1 : 0), sum), 0);
	});

	$scope.$watch("registro_info.periodo", value => {
		
		if(!value || $scope.cargando_disponibles) return;
		$scope.cargando_disponibles = true;
		
		let url = `./main/homeschool?page=periodo_libros&id_periodo=${value.id_periodo}`;

		$http.get(url).then(response => {
			console.log("response.data", response.data)
			$scope.all_items = response.data.items;
			updateListaInscripcion($scope.all_items)
		}).finally(() => {
			$scope.cargando_disponibles = false;
		});

	});
	

	$scope.loading = false;
	$scope.text_submit = "Registrar";
	$scope.post_response = {ok: false, send: false};

	$scope.submit = () => {

		if($scope.loading) return;

		$scope.loading = true; 
		$scope.text_submit = "Registrando...";

		let post_data = Object.assign({
			items: $scope.seleccionados.items.map(item => +item.id_periodo_detalle),
			id_periodo: $scope.registro_info.periodo.id_periodo
		});

		$http.post(`./main/homeschool?page=inscripcion`, post_data).then(response => {
			if(!response.data) return;
			Object.assign($scope.post_response, response.data);
			Notificaciones.alert(`Se registraton ${response.data.count} libros`);
			$scope.$parent.info.matriculas = response.data.matriculas;

			updateListaInscripcion($scope.all_items);
		}).finally(() => {
			$scope.loading = false;
			$scope.text_submit = "Registrar";
			$scope.post_response.send = true;
		});

		console.log("$scope.registro_info", $scope.registro_info);
	};

	
}]).controller("BusquedaCtrl", ["$scope", "Project", "$state", "$stateParams", function($scope, Project, $state, $stateParams){


	if($stateParams.busqueda === "aleatorio"){
		let video = Project.Videos.filter(item => item.estado == 1)[UTILS.random(0, Project.Videos.length - 1)];
		$state.go("index.play", {seo_url: video.seo_url});
	}


}]).controller("VideoCtrl", ["$scope", "Project", "Video", function($scope, Project, Video){

	$scope.video = Video;

	let casting = Video.actors || "[]";

	try{
		casting = JSON.parse(casting);
		
	}catch(e){}

	let actors = UTILS.itemsCollectionToObject(WAI.collections.actor, "actor");

	$scope.casting = casting.map(id => actors.find(actor => actor.id_actor == id));


}]).controller("PlayCtrl", ["$scope", "Project", "Video", function($scope, Project, Video){

	$scope.video = Video;

}]).controller("CuentaCtrl", ["$scope", "Project", "Usuario", "$http", "$state", "$window", "$stateParams", function($scope, Project, Usuario, $http, $state, $window, $stateParams){

	$scope.payment = null;

	if($stateParams.payment){
		$scope.payment_result = $stateParams.payment;
	}

	
	$scope.membresias = UTILS.itemsCollectionToObject(WAI.collections.membresia, "membresia");

	$scope.referal_url = WAI.base_url + "?r=" + Usuario.info.id_usuario;

	$scope.suscripcion = {
		fields: {
			plan_id: 4
		}
	};

	$scope.pagar = () => {

		let membresia = $scope.membresias.find(({plan_id}) => plan_id == $scope.suscripcion.fields.plan_id);

		if(!membresia) return $window.alert("Has seleccionado una membresía inválida");

		Culqi.publicKey = WAI.institucion.configuracion.payment.culqi_public_key;
		Culqi.options({
			lang: 'auto',
			modal: true,
			installments: false,
			//customButton: 'Pagar',
			style: {
				logo: WAI.base_url + 'assets/images/logo/favicon/android-chrome-192x192.png',
				maincolor: '#feca00',
				buttontext: '#ffffff',
				maintext: '#4A4A4A',
				desctext: '#4A4A4A'
			}
		});
   
	   Culqi.settings({
		   title: 'Suscripción 1 mes Project',
		   currency: 'PEN',
		   description: membresia.name,
		   amount: parseFloat(membresia.price)
	   });
	   Culqi.open();
	}

	$scope.payment_submit = () => {
		$window.open("https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=CXL2NV46SGD52");
	};

	/*ssetTimeout(() => {
		$("#plan_id_3").attr("checked", true)
	},100);*/

	$window.culqi = () => {
		if (Culqi.token) {
			const token = Culqi.token.id;
			console.log('Se ha creado un token:' + token);
		
		} else { 
			console.log(Culqi.error);
			alert(Culqi.error.user_message);
		}
	  };


}]).filter("moneda", ["$filter", function($filter) {
	return function() {
		var t = Array.prototype.slice.call(arguments);
		//return $filter("currency").apply(null, t);
		return t[1] = "S/ ", $filter("currency").apply(null, t)
	}
}]).filter("phone", ["$filter", function($filter) {
	return function(value) {
		return "tel:" + String(value).replace(/\D+/g,"");
	}
}]);


