angular.module('albums').controller('ArtistAlbumEditController', ['$scope', '$http', '$routeParams', '$q', '$location', 'flash', ($scope, $http, $routeParams, $q, $location, flash) ->
  album = $http.get("/artists/#{$routeParams.artist}/albums/#{$routeParams.album}.json")
  artist = $http.get("/artists.json")
  genres = $http.get("/genres.json")

  intersects = (a, b) ->
    slice = Array.prototype.slice
    rest = slice.call(arguments, 1)
    _.filter _.uniq(a), (item) ->
      _.every rest, (b) ->
        _.any(b, (element) ->  _.isEqual(element, item) )


  $q.all([album, artist, genres]).then((promises) ->
    $scope.album = promises[0].data
    $scope.album.release_date = moment($scope.album.release_date)
    $scope.maxDate = moment().format("MM/DD/YYYY")
    $scope.album.release_date_formatted =  moment($scope.album.release_date).format('MM/DD/YYYY')
    $scope.artists = _.pluck(promises[1].data, 'name')
    $scope.album.artist_friendly_id = $scope.album.artist.friendly_id
    $scope.album.artist = $scope.album.artist.name
    $scope.genres = _.pluck(promises[2].data, 'name')
    $scope.album.genres = _.pluck($scope.album.genres, 'name')
  )

  $scope.update = () ->
    $scope.errors = []
    $scope.params = {
      id: $scope.album.friendly_id,
      album: {
        title: $scope.album.title,
        rating: $scope.album.rating,
        cover: $scope.album.cover,
        release_date: moment($scope.releaseDate.getDate()).format('YYYY-MM-DD')
        is_compilation: $scope.album.is_compilation
      },
      artist: $scope.album.artist,
      genres: $scope.album.genres
    }
    $http.put(
      "/artists/#{$scope.album.artist_friendly_id}/albums/#{$scope.album.friendly_id}.json",
      $scope.params
    ).success( (data) ->
      $location.path("/artists/#{data.artist}/albums/#{data.album}")
      flash.success.setMessage(data.notice)
    ).error( (data) ->
      $scope.errors = data.errors
    )

  $scope.back = () ->
    $location.path("artists/#{$scope.album.artist.friendly_id}/albums/#{$scope.album.friendly_id}")
])