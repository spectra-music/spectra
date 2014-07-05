angular.module('artists').controller('ArtistShowController',
  ['$scope', '$http', '$stateParams', 'Artist'
  ($scope, $http, $stateParams, Artist) ->
    Artist.one $stateParams.artist, (data) ->
      $scope.artist = data
])