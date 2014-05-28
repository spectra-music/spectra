ImportController = Paloma.controller('Import');

setHighlight = ->
  $("a[href='/import']").parent().addClass("menu-item-divided pure-menu-selected")

ImportController::index = ->
  setHighlight()
  #source = new EventSource('/import/add')
  #source.addEventListener('message',
  #  (e) -> console.log('Received a message:', e.data)
  #)

ImportController.prototype.add = () -> {};