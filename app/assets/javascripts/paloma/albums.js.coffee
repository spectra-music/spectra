AlbumsController = Paloma.controller('Albums');

setHighlight = ->
  $("a[href='/albums']").parent().addClass("menu-item-divided pure-menu-selected")



AlbumsController::new = ->
  $('#album_artist').selectize({
    create: true,
    sortField: 'text'
  });
  $('#album_release_date_1i').selectize();

AlbumsController::index = ->
  setHighlight()