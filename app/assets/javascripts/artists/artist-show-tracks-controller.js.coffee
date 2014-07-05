angular.module('artists').controller('ArtistShowTracksController',
  ['$scope', 'Track', '$stateParams',
  ($scope, Track, $stateParams) ->
    Track.some {artist: $stateParams.artist}, (data) ->
      $scope.tracks = data
])