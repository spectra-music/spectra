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
#= require jquery
#= require jquery_ujs
#= require paloma
#= require selectize
#= require_tree .
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
