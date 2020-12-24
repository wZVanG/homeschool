app.directive('avatar', [function() {
    return {
        restrict: 'A',
        scope: {
            avatarLink: '=?',
            avatarUrl: '=',
            avatarSize: '=?'
        },
        link: function(scope, element){


            scope.$watch("avatarUrl", function(){

                const url_image = scope.avatarUrl;
                let a_wrap = scope.avatarLink ? `<a href="${url_image}" target="_blank">@</a>` : '@';
                
                let size =  Object.assign({width: 45, height: 45}, scope.avatarSize || {});
                a_wrap = a_wrap.replace("@", `<img class="rounded" src="${url_image}" alt="" width="${size.width}" height="${size.height}" />`);
                element.html(a_wrap);
            });

        }
    }
}]);