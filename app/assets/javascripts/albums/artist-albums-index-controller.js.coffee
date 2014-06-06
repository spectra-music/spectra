angular.module('albums').controller('ArtistAlbumsIndexController', ['$scope', '$http', '$routeParams', ($scope, $http, $routeParams) ->
  $http.get("/artists/#{$routeParams.artist}/albums.json").success( (data) ->
    $scope.albums = data
  )
])