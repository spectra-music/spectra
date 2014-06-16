angular.module('albums').controller('GenreAlbumsIndexController', ['$scope', '$http', '$routeParams', 'albumDelete', ($scope, $http, $routeParams, albumDelete) ->
  $http.get("/genres/#{$routeParams.genre}/albums").success( (data) ->
    $scope.albums = data
  )

  $scope.deleteAlbum = (album) ->
    albumDelete.deleteAlbum($scope, album)
])