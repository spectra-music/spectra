angular.module('tracks').controller('ArtistAlbumTrackShowController', ['$scope', '$http', '$routeParams', ($scope, $http, $routeParams) ->
  $http.get("/tracks/#{$routeParams.track}").success( (data) ->
    $scope.track = data
  )
])