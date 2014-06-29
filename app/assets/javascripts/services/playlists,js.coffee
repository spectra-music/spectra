angular.module('services').service('PlaylistFactory', ['Restangular', (Restangular) ->
  {
    all: (success, error) -> Restangular.all('playlists').getList().then(success, error),
    one: (id, success, error) -> Restangular.one('playlists', id).get().then(success, error),
    update: (id, params, success, error) -> Restangular.one('playlists', id).patch(params).then(success, error),
    create: (params, success, error) -> Restangular.all('playlists').post(params).then(success, error),
    destroy: (id, success, error) -> Restangular.one('playlists', id).remove().then(success, error)
  }
])