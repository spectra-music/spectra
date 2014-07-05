angular.module('playlists').controller('PlaylistIndexController'
  [ '$scope', '$q', 'Playlist', 'Flexlist', ($scope, $q, Playlist, Flexlist) ->
    Playlist.all (data) -> $scope.playlists = data

    Flexlist.all (data) -> $scope.flexlists = data

    $scope.deletePlaylist = (playlist) ->
      deletePlaylist = $window.confirm('Are you sure?')
      if deletePlaylist
        Playlist.destroy playlist.friendly_id, () ->
          flash.success.setMessage('Playlist was successfully deleted.')
          $scope.playlists.splice($scope.playlists.indexOf(playlist), 1)
          $rootScope.$emit('event:angularFlash')
  ])