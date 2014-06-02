
defaults = $http.defaults.headers
defaults.patch = defaults.patch || {}
defaults.patch['Content-Type'] = 'application/json'

# This line is related to our Angular app, not to our
# HomeCtrl specifically. This is basically how we tell
# Angular about the existence of our application.
spectra = angular.module('spectra', ['templates', 'ngResource'])

# This routing directive tells Angular about the default
# route for our application. The term "otherwise" here
# might seem somewhat awkward, but it will make more
# sense as we add more routes to our application.
spectra.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.
  otherwise({
      templateUrl: 'welcome.html',
      controller: 'WelcomeCtrl'
    })
])

spectra.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

angular.module('spectra').factory