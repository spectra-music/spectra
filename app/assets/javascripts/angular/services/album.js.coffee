angular.module('spectra').service('AlbumService', ($http) ->
  this.getAll = (scope) ->
    return $http.get('/albums.json').success( (data) ->
        scope.albums = data
      )
  return
)