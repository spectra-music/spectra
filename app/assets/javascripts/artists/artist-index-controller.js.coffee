angular.module('artists').controller('ArtistIndexController',
  ['$scope', 'ArtistFactory', ($scope, ArtistFactory) ->
    ArtistFactory.all (data) -> $scope.artists = data
  ])