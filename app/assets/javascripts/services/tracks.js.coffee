angular.module('services').service('TrackFactory', ['Restangular', (Restangular) ->
  {
    all: (success, error) -> Restangular.all('tracks').getList().then(success, error)
    some: (params, success, error) -> Restangular.all('tracks').getList(params).then(success, error),
    one: (id, success, error) -> Restangular.one('tracks', id).get().then(success, error),
    update: (id, params, success, error) -> Restangular.one('tracks', id).patch(params, {format: 'json'}).then(success, error),
    create: (params, success, error) -> Restangular.all('tracks').post(params, {format: 'json'}).then(success, error),
    destroy: (id, success, error) -> Restangular.one('tracks', id).remove({format: 'json'}).then(success, error)
  }
])