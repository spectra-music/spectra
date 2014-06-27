angular.module('artists').controller('ArtistShowAlbumsController',
  ['$scope', 'AlbumFactory', '$stateParams',
  ($scope, AlbumFactory, $stateParams) ->
    AlbumFactory.some {artist: $stateParams.artist}, (data) ->
      $scope.albums = data
])