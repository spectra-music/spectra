ArtistController = Paloma.controller('Artists');

setHighlight = ->
  $("a[href='artists']").parent().addClass("menu-item-divided pure-menu-selected")

ArtistController::index = ->
  setHighlight()
