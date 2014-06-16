angular.module('albums').service('albumDelete', ['$rootScope', '$http', '$window', 'flash', ($rootScope, $http, $window, flash) ->
  this.deleteAlbum = (scope, album) ->
    deleteAlbum = $window.confirm('Are you sure?')

    if deleteAlbum
      $http.delete(
        "/artists/#{album.artist.friendly_id}/albums/#{album.friendly_id}"
      ).success( () ->
        flash.success.setMessage('Album was successfully deleted.')
        scope.albums.splice(scope.albums.indexOf(album), 1)
        $rootScope.$emit("event:angularFlash")
      )
  return
])