angular.module('genres').controller('GenreIndexController'
  ['$scope', 'Genre', ($scope, Genre) ->
    Genre.all (data) -> $scope.genres = data
])