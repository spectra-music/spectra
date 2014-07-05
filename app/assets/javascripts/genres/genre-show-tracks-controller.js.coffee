angular.module('genres').controller('GenreShowTracksController',
  ['$scope', 'Track', '$stateParams',
  ($scope, Track, $stateParams) ->
    Track.some {genre: $stateParams.genre}, (data) ->
      $scope.tracks = data
])