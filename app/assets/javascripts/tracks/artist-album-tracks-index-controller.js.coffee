angular.module('tracks').controller('ArtistAlbumTracksIndexController', ['$scope', '$http', '$routeParams', 'trackDelete', ($scope, $http, $routeParams, trackDelete) ->
  $http.get("/tracks?album=#{$routeParams.album}").success( (data) ->
    $scope.tracks = data
  )
  $scope.newPath = "#!/artists/#{$routeParams.artist}/albums/#{$routeParams.album}/tracks/new"

  $scope.deleteTrack = (track) ->
    trackDelete.deleteTrack($scope, track)
])