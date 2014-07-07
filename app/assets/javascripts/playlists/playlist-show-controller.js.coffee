angular.module('playlists').controller('PlaylistShowController',
  ['$scope', '$stateParams', 'Playlist', 'Track', 'Sortable',
  ($scope, $stateParams, Playlist, Track, Sortable) ->
    Playlist.one $stateParams.playlist, (data) ->
      $scope.playlist = data

    queryParams = {}
    queryParams[$stateParams.type] = $stateParams.playlist

    Track.some queryParams, (data) ->
      $scope.tracks = data
      _.map $scope.tracks, (track, i) -> track.num = i+1

    $scope.sortInfo =
      current: 'num'
      reversed: false
      setField: (field) ->
        Sortable.setField($scope, field)
])