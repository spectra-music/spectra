angular.module('artists').controller('ArtistEditController'
  ['$scope', '$http', '$stateParams', '$state', 'flash', 'Artist'
  ($scope, $http, $stateParams, $state, flash, Artist) ->
    Artist.one $stateParams.artist, (data) ->
      $scope.artist = data

    $scope.update = () ->
      $scope.errors = []
      $scope.params =
        id: $scope.artist.friendly_id
        artist:
          name: $scope.artist.name
          rating: $scope.artist.rating

      success = (data) ->
        flash.success.setMessage data.notice
        $state.go "^.show", {artist: data.artist}
      error = (errResponse) ->
        $scope.errors = errResponse.data.errors

      Artist.update $stateParams.artist, $scope.params, success, error
    $scope.back = () ->
      $state.go "^.show", $stateParams
  ])