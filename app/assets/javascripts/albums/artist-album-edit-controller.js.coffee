angular.module('albums').controller('ArtistAlbumEditController', ['$scope', '$http', '$routeParams', '$q', '$location', 'flash', ($scope, $http, $routeParams, $q, $location, flash) ->
  album = $http.get("/artists/#{$routeParams.artist}/albums/#{$routeParams.album}.json")
  artist = $http.get("/artists.json")

  $q.all([album, artist]).then((promises) ->
    $scope.album = promises[0].data
    $scope.album.release_date = moment($scope.album.release_date)
    $scope.maxDate = moment().format("MM/DD/YYYY")
    $scope.album.release_date_formatted =  moment($scope.album.release_date).format('MM/DD/YYYY')
    $scope.artists = promises[1].data
    $scope.album.artist.selected = $scope.artists.filter((x) -> x.name == $scope.album.artist.name)[0]
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
      artist: $scope.album.artist.selected.name
    }
    $http.put(
      "/artists/#{$scope.album.artist.friendly_id}/albums/#{$scope.album.friendly_id}.json",
      $scope.params
    ).success( (data) ->
      $location.path("/artists/#{data.artist}/albums/#{data.album}")
      flash.success.setMessage(data.notice)
    ).error( (data) ->
      $scope.errors = data.errors
    )
])