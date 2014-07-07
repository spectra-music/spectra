angular.module('albums').controller('AlbumShowController',
  ['$scope', 'Album', '$stateParams', 'Track', 'Sortable'
  ($scope, Album, $stateParams, Track, Sortable) ->
    Album.one($stateParams.album, (data) ->
      $scope.album = data
      $scope.album.release_date = moment($scope.album.release_date).format('MM/DD/YYYY')
    )
    Track.some {album: $stateParams.album}, (data) -> $scope.tracks = data
    $scope.sortInfo =
      current: 'title'
      reversed: false
      setField: (field) ->
        Sortable.setField($scope, field)
  ])