angular.module('tracks').controller('TrackEditController',
  ['$scope', '$stateParams', '$state', 'flash', 'AlbumFactory', 'TrackFactory', 'ArtistFactory', 'GenreFactory'
  ($scope, $stateParams, $state, flash, AlbumFactory, TrackFactory, ArtistFactory, GenreFactory) ->
    $scope.pageType = 'Edit'
    AlbumFactory.all (data) ->
      $scope.albums = _.pluck(data, 'title')
    ArtistFactory.all (data) ->
      $scope.artists = _.pluck(data, 'name')
    GenreFactory.all (data) ->
      $scope.genres = _.pluck(data, 'name')
    TrackFactory.one $stateParams.track, (data) ->
      $scope.track = data
      $scope.track.date_formatted =  moment($scope.track.date).format('MM/DD/YYYY')
      $scope.track.artist = $scope.track.artist.name
      $scope.track.album = $scope.track.album.title
      $scope.track.genres = _.pluck($scope.track.genres, 'name')

    $scope.maxDate = moment().format("MM/DD/YYYY")

    $scope.save = ->
      $scope.errors = []
      $scope.params = {
        track: $scope.track,
        album: $scope.track.album,
        artist: $scope.track.artist,
        genres: $scope.track.genres
      }
      $scope.params.track.date = moment($scope.date.getDate()).format('YYYY-MM-DD')
      success = (data) ->
        flash.success.setMessage(data.notice)
        $state.go("^.index")
      error = (response) ->
        $scope.errors = response.data.errors

      TrackFactory.update($stateParams.track, $scope.params, success, error)

    $scope.back = ->
      $state.go('^.show', $stateParams)
  ])