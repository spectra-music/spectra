angular.module('genres').controller('GenreIndexController'
  ['$scope', 'Genre', 'Sortable', ($scope, Genre, Sortable) ->
    Genre.all (data) -> $scope.genres = data
    $scope.sortInfo =
      current: 'name'
      reversed: false
      setField: (field) ->
        Sortable.setField($scope, field)
])