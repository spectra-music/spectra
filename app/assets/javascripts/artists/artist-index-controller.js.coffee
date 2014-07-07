angular.module('artists').controller('ArtistIndexController'
  ['$scope', 'Artist', 'Sortable', ($scope, Artist, Sortable) ->
    Artist.all (data) -> $scope.artists = data
    $scope.sortInfo =
      current: 'name'
      reversed: false
      setField: (field) ->
        Sortable.setField($scope, field)
  ])