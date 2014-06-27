angular.module('genres').controller('GenreShowTracksController',
  ['$scope', 'TrackFactory', '$stateParams',
  ($scope, TrackFactory, $stateParams) ->
    TrackFactory.some {genre: $stateParams.genre}, (data) ->
      $scope.tracks = data
])