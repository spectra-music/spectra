angular.module 'albums'
  .controller 'AlbumEditController',
    ['$scope', '$stateParams', '$q', '$location', 'flash', 'Album', 'Artist', 'Genre'
    ($scope, $stateParams, $q, $location, flash, Album, Artist, Genre) ->
      Album.one $stateParams.album, (data)->
        $scope.album = data
        $scope.album.release_date = moment($scope.album.release_date)
        $scope.album.release_date_formatted =  moment($scope.album.release_date).format('MM/DD/YYYY')
        $scope.album.artist = $scope.album.artist.name
        $scope.album.genres = _.pluck($scope.album.genres, 'name')

      Artist.all (data) -> $scope.artists = _.pluck data, 'name'
      Genre.all (data) -> $scope.genres = _.pluck data, 'name'

      $scope.maxDate = moment().format("MM/DD/YYYY")

      $scope.update = ->
        $scope.errors = []
        $scope.params =
          id: $scope.album.friendly_id,
          album:
            title: $scope.album.title
            rating: $scope.album.rating
            cover: $scope.album.cover
            release_date: moment($scope.releaseDate.getDate()).format('YYYY-MM-DD')
            is_compilation: $scope.album.is_compilation
          artist: $scope.album.artist
          genres: $scope.album.genres

        error = (errResponse) ->
          $scope.errors = errResponse.data.errors
        success = (data) ->
          flash.success.setMessage(data.notice)
          $location.path("/albums/#{data.album}")
        Album.update($stateParams.album, $scope.params, success, error)

      $scope.back = () ->
        $location.path("albums/#{$stateParams.album}")
    ]