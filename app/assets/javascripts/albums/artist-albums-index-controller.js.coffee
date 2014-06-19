angular.module('albums').controller('ArtistAlbumsIndexController', ['$scope', '$http', '$routeParams', 'albumDelete', ($scope, $http, $routeParams, albumDelete) ->
  $http.get("/albums?artist=#{$routeParams.artist}").success( (data) ->
    $scope.albums = data
  )

  $scope.deleteAlbum = (album) ->
    albumDelete.deleteAlbum($scope, album)
])