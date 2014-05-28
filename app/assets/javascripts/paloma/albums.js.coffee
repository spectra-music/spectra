AlbumsController = Paloma.controller('Albums');

setHighlight = ->
  $("a[href='/albums']").parent().addClass("menu-item-divided pure-menu-selected")



AlbumsController::new = ->
  $('#album_artist_id').selectize({
    create: true,
    sortField: 'text'
  });

AlbumsController::index = ->
  setHighlight()