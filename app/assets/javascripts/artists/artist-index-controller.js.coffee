angular.module('artists').controller('ArtistIndexController'
  ['$scope', 'Artist', ($scope, Artist) ->
    Artist.all (data) -> $scope.artists = data
  ])