angular.module('artists').controller('ArtistsIndexController', ['$scope', '$http', ($scope, $http) ->
  $http.get('/artists').success( (data) ->
    $scope.artists = data
  )
])