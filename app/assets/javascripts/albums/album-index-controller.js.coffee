angular.module('albums').controller('AlbumIndexController', ['$scope', 'AlbumFactory', ($scope, AlbumFactory) ->
  AlbumFactory.all (data) ->
    $scope.albums = data
    _.map($scope.albums, (album) -> album.release_date = moment(album.release_date).format('MM/DD/YYYY'))
])