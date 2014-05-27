ImportController = Paloma.controller('Import');

setHighlight = ->
  $("a[href='import']").parent().addClass("menu-item-divided pure-menu-selected")

ImportController::index = ->
  setHighlight()
