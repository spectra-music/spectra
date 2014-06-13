angular.module('tracks').controller('ArtistAlbumTracksIndexController', ['$scope', '$http', '$routeParams', 'trackDelete', ($scope, $http, $routeParams, trackDelete) ->
  $http.get("/artists/#{$routeParams.artist}/albums/#{$routeParams.album}/tracks.json").success( (data) ->
    $scope.tracks = data
  )

  $scope.deleteTrack = (track) ->
    trackDelete.deleteTrack($scope, track)
])