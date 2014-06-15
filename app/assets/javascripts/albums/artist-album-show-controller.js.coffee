angular.module('albums').controller('ArtistAlbumShowController', ['$scope', '$http', '$routeParams', ($scope, $http, $routeParams) ->
  $http.get("/artists/#{$routeParams.artist}/albums/#{$routeParams.album}.json").success( (data) ->
    $scope.album = data
  )
])