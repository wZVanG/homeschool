app.directive('waiFileModule', ["API", "$compile", "Upload", "$mdToast", "$timeout", function(API, $compile, Upload, $mdToast, $timeout) {
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
                    file.upload = Upload.upload({
                        //url: 'https://angular-file-upload-cors-srv.appspot.com/upload',
                        url: API.url("upload", "index", $scope.waiFileModule),
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
/*
            $scope.archivo_subiendo = false;   

            var uploader = $scope.uploader = new FileUploader({
                url: API.url("upload", "upload")
            });
        
            // FILTERS
        
            uploader.filters.push({
                name: 'customFilter',
                fn: function(item 
                    //{File|FileLikeObject}
                    , options) {
                    return this.queue.length <= 1;
                }
            });
        
           uploader.onCompleteItem = function(fileItem, response, status, headers) {
                if(response.error){
                    $mdToast.show(
                        $mdToast.simple()
                        .textContent(response.mensaje)
                        .hideDelay(2000));
                    uploader.queue.length && $scope.eliminarArchivo(uploader.queue[0]); 
                    return;
                } 
                console.log("response.upload_data", response.upload_data);
                //$scope.usuario_info.foto = response.upload_data.file_name;
                uploader.queue = []
            };
        
            uploader.onCompleteAll = function() {
                console.info('onCompleteAll');
                
                $scope.archivo_subiendo = false;
            };
        
            $scope.eliminarArchivo = function(archivo){
                archivo.remove();
                //angular.element("#adjuntar_archivo").val("");
                delete $scope.usuario_info.nombre_archivo;
            };
        
        
            $scope.$watch(function(){
                return $scope.uploader.queue.length;
            }, function(length){
                $scope.foto_nuevo = length ? 1 : 0;
            });
        */

            parent.append(upload_element);

            $compile(upload_element)($scope);
        }
    }
}]);