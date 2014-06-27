angular.module('genres').controller('GenreIndexController', ['$scope', 'GenreFactory', ($scope, GenreFactory) ->
  GenreFactory.all (data) -> $scope.genres = data
])