angular.module('artists').controller('ArtistsIndexController', ['$scope', '$http', ($scope, $http) ->
  $http.get('/artists.json').success( (data) ->
    $scope.artists = data
  )
])