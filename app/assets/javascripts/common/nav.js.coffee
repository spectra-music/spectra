angular.module('spectra').controller('NavController', ($scope, $location) ->
  $scope.isActive  = (loc) ->
    loc == $location.path()
)