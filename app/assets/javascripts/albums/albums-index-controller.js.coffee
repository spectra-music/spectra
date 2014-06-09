angular.module('albums').controller('AlbumsIndexController', ['$scope', '$http', ($scope, $http) ->
  $http.get('/albums.json').success( (data) ->
    $scope.albums = data
  )
])