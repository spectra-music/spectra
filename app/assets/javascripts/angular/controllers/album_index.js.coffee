angular.module('spectra').controller('AlbumIndexController', ['$scope', 'AlbumService', ($scope, AlbumService) ->
  AlbumService.getAll($scope)
  return
])