angular.module('tracks').controller('TrackEditController', ['$q', '$scope', '$http', '$routeParams', '$location', 'flash', ($q, $scope, $http, $routeParams, $location, flash) ->
  $scope.pageType = 'Edit'
  albums = $http.get("/albums.json")
  artists = $http.get("/artists.json")
  genres = $http.get("/genres.json")
  track  = $http.get("/artists/#{$routeParams.artist}/albums/#{$routeParams.album}/tracks/#{$routeParams.track}.json")

  $q.all([track, artists, albums, genres]).then((promises) ->
    $scope.track = promises[0].data
    $scope.maxDate = moment().format("MM/DD/YYYY")
    $scope.track.date_formatted =  moment($scope.track.date).format('MM/DD/YYYY')
    $scope.artists = _.pluck(promises[1].data, 'name')
    $scope.albums = _.pluck(promises[2].data, 'title')
    $scope.track.artist = $scope.track.artist.name
    $scope.track.album = $scope.track.album.title
    $scope.genres = _.pluck(promises[3].data, 'name')
    $scope.track.genres = _.pluck($scope.track.genres, 'name')
  )

  $scope.save = () ->
    $scope.errors = []
    $scope.params = {
      track: $scope.track,
      album: $scope.track.album,
      artist: $scope.track.artist
    }
    $scope.params.track.date = moment($scope.date.getDate()).format('YYYY-MM-DD')
    $http.put(
      "/artists/#{$routeParams.artist}/albums/#{$routeParams.album}/tracks/#{$routeParams.track}.json",
      $scope.params
    ).success( (data) ->
      flash.success.setMessage(data.notice)
      $location.path("/artists/#{data.artist}/albums/#{data.album}/tracks/#{data.track}")
    ).error( (data) ->
      $scope.errors = data.errors
    )
])