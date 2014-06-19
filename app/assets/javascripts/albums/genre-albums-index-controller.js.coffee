angular.module('albums').controller('GenreAlbumsIndexController', ['$scope', '$http', '$routeParams', 'albumDelete', ($scope, $http, $routeParams, albumDelete) ->
  $http.get("/albums?genre=${$routeParams.genre}").success( (data) ->
    $scope.albums = data
  )

  $scope.deleteAlbum = (album) ->
    albumDelete.deleteAlbum($scope, album)
])