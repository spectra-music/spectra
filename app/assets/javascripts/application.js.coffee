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
#= require selectize

# Angular Stuff
#= require angular
#= require angular-resource
#= require spectra

# The default require
#= require_tree .

#  For templates
#= require angular-rails-templates
#= require_tree ../templates

# This is for the sidebar
# We'll fix this up later
# TODO: Clean this up and put it somewhere else
###
((window, document) ->
  $ ->
    toggleClass = (element, className) ->
      classes = element.className.split(/\s+/)
      length = classes.length
      i = 0
      while i < length
        if classes[i] is className
          classes.splice i, 1
          break
        i++

      # The className is not found
      classes.push className  if length is classes.length
      element.className = classes.join(" ")
      return
    layout = document.getElementById("layout")
    menu = document.getElementById("menu")
    menuLink = document.getElementById("menuLink")
    menuLink.onclick = (e) ->
      active = "active"
      e.preventDefault()
      toggleClass layout, active
      toggleClass menu, active
      toggleClass menuLink, active
      return

    return

  return
) this, @document
###
