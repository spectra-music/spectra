angular.module('artists').controller('ArtistShowTracksController',
  ['$scope', 'TrackFactory', '$stateParams',
  ($scope, TrackFactory, $stateParams) ->
    TrackFactory.some {artist: $stateParams.artist}, (data) ->
      $scope.tracks = data
])