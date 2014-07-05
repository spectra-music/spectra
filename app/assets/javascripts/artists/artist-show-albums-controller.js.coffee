angular.module('artists').controller('ArtistShowAlbumsController',
  ['$scope', 'Album', '$stateParams',
  ($scope, Album, $stateParams) ->
    Album.some {artist: $stateParams.artist}, (data) ->
      $scope.albums = data
])