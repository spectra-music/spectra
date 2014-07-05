angular.module('services').service 'Genre', ['Restangular', (Restangular) ->
  all: (success, error) -> Restangular.all('genres').getList().then(success, error)
  one: (id, success, error) -> Restangular.one('genres', id).get().then(success, error)
]