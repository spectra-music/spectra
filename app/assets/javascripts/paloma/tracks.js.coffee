TracksController = Paloma.controller('Tracks')

setHighlight = ->
  $("a[href='/tracks']").parent().addClass("menu-item-divided pure-menu-selected")

TracksController::index = ->
  setHighlight()