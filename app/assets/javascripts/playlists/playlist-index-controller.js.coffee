angular.module('playlists').controller('PlaylistIndexController'
  [ '$scope', '$q', 'Playlist', 'Flexlist', 'Sortable', ($scope, $q, Playlist, Flexlist, Sortable) ->
    Playlist.all (data) ->
      $scope.playlists = data
      playlist.type = 'playlist' for playlist in $scope.playlists

    Flexlist.all (data) ->
      $scope.flexlists = data
      flexlist.type = 'flexlist' for flexlist in $scope.flexlists

    $scope.deletePlaylist = (playlist) ->
      deletePlaylist = $window.confirm('Are you sure?')
      if deletePlaylist
        Playlist.destroy playlist.friendly_id, () ->
          flash.success.setMessage('Playlist was successfully deleted.')
          $scope.playlists.splice($scope.playlists.indexOf(playlist), 1)
          $rootScope.$emit('event:angularFlash')
    $scope.sortInfo =
      current: 'name'
      reversed: false
      setField: (field) ->
        Sortable.setField($scope, field)
  ])