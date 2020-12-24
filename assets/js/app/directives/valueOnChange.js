app.directive('valueOnChange', function($timeout) {
    return function(scope, element, attr) {
      scope.$watch(attr.valueOnChange, function(nv,ov) {
        if (nv != ov) {
          element.addClass('changed');
          $timeout(function() {
            element.removeClass('changed');
          }, 500); 
        }
      });
    };
  });