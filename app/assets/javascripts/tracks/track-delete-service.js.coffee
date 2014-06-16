angular.module('tracks').service('trackDelete', ['$rootScope', '$http', '$window', 'flash', ($rootScope, $http, $window, flash) ->
  this.deleteTrack = (scope, track) ->
    deleteTrack = $window.confirm('Are you sure?')

    if deleteTrack
      $http.delete(
        "/artists/#{track.artist.friendly_id}/albums/#{track.album.friendly_id}/tracks/#{track.friendly_id}"
      ).success( () ->
        flash.success.setMessage('Track was successfully deleted.')
        scope.tracks.splice(scope.tracks.indexOf(track), 1)
        $rootScope.$emit("event:angularFlash")
      )
  return
])