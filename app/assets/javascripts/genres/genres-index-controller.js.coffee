angular.module('genres').controller('GenresIndexController', ['$scope', '$http', ($scope, $http) ->
  $http.get('/genres').success( (data) ->
    $scope.genres = data
  )
])