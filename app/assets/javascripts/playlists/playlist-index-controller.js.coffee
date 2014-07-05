angular.module('playlists').controller('PlaylistIndexController'
  [ '$scope', '$q', 'Playlist', ($scope, $q, Playlist) ->
    playlists = Playlist.all

    flexlists = Flexlist.all

    $q.all [playlists, flexlists], (promises) ->
      playlist.type = 'playlist' for playlist in promises[0].data
      playlist.type = 'flexlist' for playlist in promises[1].data
      $scope.playlists = promises[0].data
      $scope.playlists.concat(promises[1].data)

    $scope.deletePlaylist = (playlist) ->
      deletePlaylist = $window.confirm('Are you sure?')
      if deletePlaylist
        Playlist.destroy playlist.friendly_id, () ->
          flash.success.setMessage('Playlist was successfully deleted.')
          $scope.playlists.splice($scope.playlists.indexOf(playlist), 1)
          $rootScope.$emit('event:angularFlash')
  ])