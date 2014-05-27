AlbumsController = Paloma.controller('Albums');

setHighlight = ->
  $("a[href='albums']").parent().addClass("menu-item-divided pure-menu-selected")

AlbumsController::index = ->
  setHighlight()
