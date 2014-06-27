angular.module('genres').controller('GenreShowController',
  ['$scope', 'GenreFactory', '$stateParams',
  ($scope, GenreFactory, $stateParams) ->
    GenreFactory.one $stateParams.genre, (data) ->
      $scope.genre = data
])