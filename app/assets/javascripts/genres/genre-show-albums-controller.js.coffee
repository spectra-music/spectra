angular.module('genres').controller('GenreShowAlbumsController',
  ['$scope', 'AlbumFactory', '$stateParams',
  ($scope, AlbumFactory, $stateParams) ->
    AlbumFactory.some {genre: $stateParams.genre}, (data) ->
      $scope.albums = data
])