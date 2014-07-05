angular.module('services').service 'Flexlist', ['Restangular', (Restangular) ->
  all: (success, error) -> Restangular.all('flexlists').getList().then(success, error)
  one: (id, success, error) -> Restangular.one('flexlists', id).get().then(success, error)
  update: (id, params, success, error) -> Restangular.one('flexlists', id).patch(params).then(success, error)
  create: (params, success, error) -> Restangular.all('flexlists').post(params).then(success, error)
  destroy: (id, success, error) -> Restangular.one('flexlists', id).remove().then(success, error)
]