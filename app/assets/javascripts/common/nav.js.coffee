angular.module('spectra').controller('NavController', ($scope, $location, $state) ->
  $scope.isActive  = (loc) -> loc is $state.current.name.split('.')[0]
)