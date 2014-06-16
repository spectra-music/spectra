angular.module('tracks').controller('TrackNewController', ['$q', '$scope', '$http','$routeParams', '$location', 'flash', ($q, $scope, $http, $routeParams, $location, flash) ->
  $scope.pageType = 'New'
  $scope.setDefaultDate = 'false'
  albums = $http.get("/albums")
  artists = $http.get("/artists")
  genres = $http.get("/genres")

  $q.all([artists, albums, genres]).then((promises) ->
    $scope.track = {}
    $scope.track.artist = _.findWhere(promises[0].data, {'friendly_id': $routeParams.artist}).name
    $scope.track.album = _.findWhere(promises[1].data, {'friendly_id': $routeParams.album}).title
    $scope.maxDate = moment().format("MM/DD/YYYY")
    $scope.track.date_formatted =  moment($scope.track.date).format('MM/DD/YYYY')
    $scope.artists = _.pluck(promises[0].data, 'name')
    $scope.albums = _.pluck(promises[1].data, 'title')
    $scope.genres = _.pluck(promises[2].data, 'name')
  )

  $scope.save = () ->
    $scope.errors = []
    $scope.params = {
      track: $scope.track,
      album: $scope.track.album,
      artist: $scope.track.artist
    }
    $scope.params.track.date = moment($scope.date.getDate()).format('YYYY-MM-DD')
    $http.post(
      "/tracks",
      $scope.params
    ).success( (data) ->
      flash.success.setMessage(data.notice)
      $location.path("/artists/#{data.artist}/albums/#{data.album}/tracks/#{data.track}")
    ).error( (data) ->
      $scope.errors = data.errors
    )
])