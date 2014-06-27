angular.module('tracks').controller('TrackNewController',
  ['$scope', '$state', 'flash', 'AlbumFactory', 'ArtistFactory', 'GenreFactory', 'TrackFactory',
  ($scope, $state, flash, AlbumFactory, ArtistFactory, GenreFactory, TrackFactory) ->
    $scope.pageType = 'New'
    $scope.setDefaultDate = 'false'
    AlbumFactory.all (data) ->
      $scope.albums = _.pluck(data, 'title')
    ArtistFactory.all (data) ->
      $scope.artists = _.pluck(data, 'name')
    GenreFactory.all (data) ->
      $scope.genres = _.pluck(data, 'name')

    $scope.track = {}
    $scope.maxDate = moment().format("MM/DD/YYYY")
    $scope.track.date_formatted =  moment($scope.track.date).format('MM/DD/YYYY')
    $scope.track.genres = []


    $scope.save = () ->
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
        $state.go('^.index')
      error = (response) ->
        $scope.errors = response.data.errors
      TrackFactory.create($scope.params, success, error)
  ])