angular.module('tracks').controller('TrackIndexController',
  ['$scope', '$http', '$window', 'TrackFactory', 'flash', '$rootScope',
  ($scope, $http, $window, TrackFactory, flash, $rootScope) ->
    TrackFactory.all (data) ->
      $scope.tracks = data

      _.map($scope.tracks, (track) ->
        console.log track.date
        track.date = moment(track.date).format('MMMM Do YYYY'))

    $scope.deleteTrack = (track) ->
      deleteTrack = $window.confirm('Are you sure?')
      if deleteTrack
        TrackFactory.destroy(track.friendly_id, () ->
          flash.success.setMessage('Track was successfully deleted.')
          $scope.tracks.splice($scope.tracks.indexOf(track), 1)
          $rootScope.$emit('event:angularFlash')
        )
  ])