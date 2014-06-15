angular.module('genres').controller('GenresIndexController', ['$scope', '$http', ($scope, $http) ->
  $http.get('/genres.json').success( (data) ->
    $scope.genres = data
  )
])