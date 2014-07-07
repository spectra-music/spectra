angular.module('albums').controller('AlbumIndexController'
  ['$scope', 'Album', 'Sortable', ($scope, Album, Sortable) ->
    $scope.sortInfo =
      current: 'title'
      reversed: false
      setField: (field) ->
        Sortable.setField($scope, field)

    Album.all (data) ->
      $scope.albums = data
      _.map $scope.albums, (album) ->
        album.release_date = moment(album.release_date).format('MM/DD/YYYY')
        album.date = moment(album.release_date).toDate()
  ])