angular.module('spectra').controller('AlbumIndexController', ['$scope', '$http', ($scope, $http) ->
  $http.get('/albums.json').success( (data) ->
    $scope.albums = data
  )
])