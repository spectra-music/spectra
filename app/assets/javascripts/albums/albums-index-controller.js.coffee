angular.module('albums').controller('AlbumsIndexController', ['$scope', '$http', 'albumDelete', ($scope, $http, albumDelete) ->
  $http.get('/albums').success( (data) ->
    $scope.albums = data
  )

  $scope.deleteAlbum = (album) ->
    albumDelete.deleteAlbum($scope, album)
])