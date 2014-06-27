angular.module('artists').controller('ArtistShowController',
  ['$scope', '$http', '$stateParams', 'ArtistFactory'
  ($scope, $http, $stateParams, ArtistFactory) ->
    ArtistFactory.one $stateParams.artist, (data) ->
      $scope.artist = data
])