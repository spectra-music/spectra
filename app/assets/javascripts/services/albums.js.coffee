angular.module('services').factory 'Album', ['Restangular', (Restangular) ->
  all: (success, error) -> Restangular.all('albums').getList().then(success, error)
  some: (params, success, error) -> Restangular.all('albums').getList(params).then(success, error)
  one: (id, success, error) -> Restangular.one('albums', id).get().then(success, error)
  update: (id, params, success, error) -> Restangular.one('albums', id).patch(params).then(success, error)
]