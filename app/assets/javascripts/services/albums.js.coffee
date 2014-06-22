angular.module('services').factory('AlbumFactory', ['Restangular', (Restangular) ->
  {
    all: (success, params, error) -> Restangular.all('albums').getList(params).then(success, error),
    one: (id, success, error) -> Restangular.one('albums', id).get().then(success, error),
    update: (id, params, success, error) -> Restangular.one('albums', id).patch(params, {format: 'json'}).then(success, error)
  }
])