angular.module('tracks').controller('TracksIndexController', ['$scope', '$http', 'trackDelete', ($scope, $http, trackDelete) ->
  $http.get('/tracks.json').success( (data) ->
    $scope.tracks = data
    _.map($scope.tracks, (track) -> track.date = moment(track.date).format('MMMM Do YYYY'))
  )

  $scope.deleteTrack = (track) ->
    trackDelete.deleteTrack($scope, track)
])