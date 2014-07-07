# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
# Other stuff
#= require jquery
#= require jquery_ujs
#= require selectize
#= require moment
#= require pikaday
#= require underscore

# Angular Stuff
#= require angular
#= require angular-resource
#= require angular-route
#= require common/sortable
#= require spectra
#= require_tree ./common
#= require services/services
#= require albums/albums
#= require artists/artists
#= require genres/genres
#= require tracks/tracks
#= require playlists/playlists

# The default require
#= require_tree .