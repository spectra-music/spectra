angular.module('albums').controller('ArtistAlbumShowController', ['$scope', '$http', '$routeParams', ($scope, $http, $routeParams) ->
  $http.get("/albums/#{$routeParams.album}").success( (data) ->
    $scope.album = data
  )
])