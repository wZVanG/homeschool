

app.directive('vistaPrevia', ["$window", "$mdUtil", "$mdMedia", function($window, $mdUtil, $mdMedia) {
    return {
        restrict: 'A',
        scope: {
            vistaPrevia: '='
        },
        link: function(scope, element){

            var el = $(element);

            if(!scope.vistaPrevia) return;

            el.click(() => $window.open(scope.vistaPrevia, "preview_img"));

            if($mdUtil.isIos || $mdUtil.isAndroid || $mdMedia('sm') || $mdMedia('xs')) return;

            var c = Object.assign({}, {
                xOffset: 10,
                yOffset: 30
            });

			el.hover(function(b) {
                
				this.t = this.title, this.title = "";
				var d = "" != this.t ? this.t : "";
                $("body").append( `
                    <div id="preview_img">
                        <div>
                            <img src="${scope.vistaPrevia}" alt="Vista previa" />
                            <div>${d}</div>
                        </div>
                    </div> 
                `), $("#preview_img").css({
					//top: b.pageY - c.xOffset + "px",
					left: b.pageX + c.yOffset + "px"
				}).fadeIn()
			}, function() {
				this.title = this.t, $("#preview_img").remove()
			}), el.mousemove(function(b) {
				//$("#preview_img").css("top", b.pageY - c.xOffset + "px").css("left", b.pageX + c.yOffset + "px")
            });
            

        }
    }
}]);