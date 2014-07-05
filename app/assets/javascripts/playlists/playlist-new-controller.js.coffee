angular.module('playlists').controller('PlaylistNewController',
  ['$scope','$state', 'Playlist', 'flash', ($scope, $state, Playlist, flash) ->

    $scope.playlist = {}
    $scope.pageType = 'New'

    $scope.save = ->
      $scope.errors = []
      $scope.params =
        playlist: $scope.playlist
      success = (data) ->
        flash.success.setMessage(data.notice)
        $state.go('^.show', {playlist: data.playlist})
      error = (response) ->
        $scope.errors = response.data.errors
      Playlist.create($scope.params, success, error)

    $scope.back = ->
      $state.go '^.index'
  ])