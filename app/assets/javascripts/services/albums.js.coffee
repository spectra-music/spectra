angular.module('services').factory('Album', ['$resource', ($resource)->
  $resource('albums/:id.json', {id:'@id'}, {
    get: {method:'GET'},
    query: {method:'GET', isArray:true},
    update: {method:'PUT'}
  }
])