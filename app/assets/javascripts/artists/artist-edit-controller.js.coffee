angular.module('artists').controller('ArtistEditController', ['$scope', '$http', '$routeParams', '$location', 'flash', ($scope, $http, $routeParams, $location, flash) ->
  $http.get("/artists/#{$routeParams.artist}.json")
    .success( (data) ->
      $scope.artist = data
    )

  $scope.update = () ->
    $scope.errors = []
    $scope.params = {
      id: $scope.artist.friendly_id,
      artist: {
        name: $scope.artist.name,
        rating: $scope.artist.rating,
      }
    }
    $http.put(
      "/artists/#{$scope.artist.friendly_id}",
      $scope.params
    ).success( (data) ->
      flash.success.setMessage(data.notice)
      $location.path("/artists/#{data.artist}")
    ).error( (data) ->
      $scope.errors = data.errors
    )
])