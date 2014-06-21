angular.module('services').service('Genre', ['$resource', ($resource)->
  $resource('genres/:id.json', {id:'@id'}, {
    get: {method:'GET'},
    query: {method:'GET', isArray:true}
  }
])