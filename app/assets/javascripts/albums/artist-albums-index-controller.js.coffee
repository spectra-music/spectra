angular.module('albums').controller('ArtistAlbumsIndexController', ['$scope', '$http', '$routeParams', 'albumDelete', ($scope, $http, $routeParams, albumDelete) ->
  $http.get("/artists/#{$routeParams.artist}/albums.json").success( (data) ->
    $scope.albums = data
  )

  $scope.deleteAlbum = (album) ->
    albumDelete.deleteAlbum($scope, album)

])