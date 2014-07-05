angular.module('genres').controller('GenreShowAlbumsController',
  ['$scope', 'Album', '$stateParams',
  ($scope, Album, $stateParams) ->
    Album.some {genre: $stateParams.genre}, (data) ->
      $scope.albums = data
])