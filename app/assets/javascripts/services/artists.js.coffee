angular.module('services').factory('Artist', ['$resource', ($resource)->
  $resource('artist/:id.json', {id:'@id'}, {
    get: {method:'GET'},
    query: {method:'GET', isArray:true},
    update: {method:'PUT'}
  }
])