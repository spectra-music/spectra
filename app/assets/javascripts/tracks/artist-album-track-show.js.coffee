angular.module('tracks').controller('ArtistAlbumTrackShowController', ['$scope', '$http', '$routeParams', ($scope, $http, $routeParams) ->
  $http.get("/artists/#{$routeParams.artist}/albums/#{$routeParams.album}/tracks/#{$routeParams.track}.json").success( (data) ->
    $scope.track = data
  )
])