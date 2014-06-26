angular.module('genres').controller('GenresIndexController', ['$scope', 'GenreFactory', ($scope, GenreFactory) ->
  GenreFactory.all (data) -> $scope.genres = data
])