angular.module('artists').controller('ArtistShowController', ['$scope', '$http', '$routeParams', ($scope, $http, $routeParams) ->
  $http.get("/artists/#{$routeParams.artist}.json").success( (data) ->
    $scope.artist = data
  )
])