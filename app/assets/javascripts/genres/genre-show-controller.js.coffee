angular.module('genres').controller('GenreShowController'
  ['$scope', 'Genre', '$stateParams'
  ($scope, Genre, $stateParams) ->
    Genre.one $stateParams.genre, (data) ->
      $scope.genre = data
])