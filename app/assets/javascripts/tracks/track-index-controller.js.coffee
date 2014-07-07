angular.module('tracks').controller('TrackIndexController'
  ['$scope', '$http', '$window', 'Track', 'flash', '$rootScope', 'Sortable'
  ($scope, $http, $window, Track, flash, $rootScope, Sortable) ->
    Track.all (data) ->
      $scope.tracks = data

      _.map $scope.tracks, (track) ->
        track.date = moment(track.date).format('MMMM Do YYYY')

    $scope.deleteTrack = (track) ->
      deleteTrack = $window.confirm 'Are you sure?'
      if deleteTrack
        Track.destroy track.friendly_id, () ->
          flash.success.setMessage 'Track was successfully deleted.'
          $scope.tracks.splice $scope.tracks.indexOf(track), 1
          $rootScope.$emit 'event:angularFlash'
    $scope.sortInfo =
      current: 'title'
      reversed: false
      setField: (field) ->
        Sortable.setField($scope, field)
  ])