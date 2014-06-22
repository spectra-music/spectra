angular.module('albums').controller('AlbumShowController',
  ['$scope', 'AlbumFactory', '$stateParams', 'TrackFactory',
  ($scope, AlbumFactory, $stateParams, TrackFactory) ->
    AlbumFactory.one($stateParams.album, (data) ->
      $scope.album = data
      $scope.album.release_date = moment($scope.album.release_date).format('MM/DD/YYYY')
    )
    TrackFactory.all (data) ->
        $scope.tracks = data
      ,{album: $stateParams.album}
  ])