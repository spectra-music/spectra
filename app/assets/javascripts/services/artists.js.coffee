angular.module('services').factory('ArtistFactory', ['Restangular', (Restangular) ->
  {
    all: (success, params, error) -> Restangular.all('artists').getList(params).then(success, error),
    one: (id, success, error) -> Restangular.one('artists', id).get().then(success, error),
    update: (id, params, success, error) -> Restangular.one('artists', id).patch(params, {format: 'json'}).then(success, error)
  }
])