angular.module('playlists').controller('PlaylistEditController',
  ['$scope','$state', '$stateParams', 'Playlist', 'flash',
  ($scope, $state, $stateParams, Playlist, flash) ->
    Playlist.one $stateParams.playlist, (data) ->
      $scope.playlist = data

    $scope.pageType = 'Edit'

    $scope.update = ->
      $scope.errors = []
      $scope.params =
        playlist: $scope.playlist
      success = (data) ->
        flash.success.setMessage(data.notice)
        $state.go '^.show', {playlist: data.playlist}
      error = (response) ->
        $scope.errors = response.data.errors
      Playlist.update($stateParams.playlist, $scope.params, success, error)

    $scope.back = ->
      $state.go '^.show'
  ])