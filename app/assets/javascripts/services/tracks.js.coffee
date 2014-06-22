angular.module('services').service('TrackFactory', ['$resource', ($resource)->
  $resource('tracks/:id.json', {id:'@id'}, {
    get: {method:'GET'},
    query: {method:'GET', isArray:true},
    update: {method:'PUT'},
    create: {method: 'POST'},
    delete: {method: 'DELETE'}
  })
])