angular.module('albums').controller('AlbumShowController', ['$scope', 'AlbumFactory', '$stateParams', ($scope, AlbumFactory, $stateParams) ->
  AlbumFactory.one($stateParams.album, (data) ->
    $scope.album = data
    $scope.album.release_date = moment($scope.album.release_date).format('MM/DD/YYYY')
  )
])