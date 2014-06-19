angular.module('tracks').controller('TrackNewController', ['$q', '$scope', '$http','$routeParams', '$location', 'flash', ($q, $scope, $http, $routeParams, $location, flash) ->
  $scope.pageType = 'New'
  $scope.setDefaultDate = 'false'
  albums = $http.get("/albums")
  artists = $http.get("/artists")
  genres = $http.get("/genres")

  $q.all([artists, albums, genres]).then((promises) ->
    $scope.track = {}
    $scope.maxDate = moment().format("MM/DD/YYYY")
    $scope.track.date_formatted =  moment($scope.track.date).format('MM/DD/YYYY')
    $scope.artists = _.pluck(promises[0].data, 'name')
    $scope.albums = _.pluck(promises[1].data, 'title')
    $scope.genres = _.pluck(promises[2].data, 'name')
    $scope.track.genres = []
  )

  $scope.save = () ->
    $scope.errors = []
    $scope.params = {
      track: $scope.track,
      album: $scope.track.album,
      artist: $scope.track.artist,
      genres: $scope.track.genres
    }
    $scope.params.track.date = moment($scope.date.getDate()).format('YYYY-MM-DD')
    $http.post(
      "/tracks.json",
      $scope.params
    ).success( (data) ->
      flash.success.setMessage(data.notice)
      $location.path("/artists/#{data.artist}/albums/#{data.album}/tracks/#{data.track}")
    ).error( (data) ->
      $scope.errors = data.errors
    )
])