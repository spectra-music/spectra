angular.module('genres').controller('GenreShowController', ['$scope', '$http', '$routeParams', ($scope, $http, $routeParams) ->
  $http.get("/genres/#{$routeParams.genre}.json").success( (data) ->
    $scope.genre = data
  )
])