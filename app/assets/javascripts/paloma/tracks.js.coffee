TracksController = Paloma.controller('Tracks');

setHighlight = ->
  $("a[href='/tracks']").parent().addClass("menu-item-divided pure-menu-selected")

TracksController::index = ->
  setHighlight()

TracksController::new = ->
  $('#track_artist_id').selectize({
    create: true,
    sortField: 'text'
  });
  $('#track_album_id').selectize({
    create: true,
    sortField: 'text'
  });