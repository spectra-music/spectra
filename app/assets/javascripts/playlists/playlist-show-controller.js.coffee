angular.module('playlists').controller('PlaylistShowController',
  ['$scope', '$stateParams', 'Playlist', 'Track', ($scope, $stateParams, Playlist, Track) ->
    Playlist.one $stateParams.playlist, (data) ->
      $scope.playlist = data

    queryParams = {}
    queryParams[$stateParams.type] = $stateParams.playlist

    Track.some queryParams, (data) ->
      $scope.tracks = data
])