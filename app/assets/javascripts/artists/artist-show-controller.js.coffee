angular.module('artists').controller('ArtistShowController', ['$scope', '$http', '$routeParams', ($scope, $http, $routeParams) ->
  $http.get("/artists/#{$routeParams.artist}").success( (data) ->
    $scope.artist = data
  )
])