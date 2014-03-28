$(document).ready(function(){

  var map = L.map('map-display', { scrollWheelZoom: false });
  map.setView([47.63, -122.32], 11);
  var layer = L.tileLayer.provider('Stamen.Watercolor');
  layer.addTo(map);
  var geomDisplayLayer = L.geoJson(JSON.parse(neighborhoodGeom));
  map.addLayer(geomDisplayLayer);

  if ($('.map-field').length > 0){
    var $map = $('.map-field');
    var $mapButton = $('.admin-toolbar-buttons .edit-button.map');

    var mapVisible = true;
    $mapButton.on('click', 'a', function(e){
      if (mapVisible) {
        $(this).text('Show map');
        mapVisible = false;
      }
      else {
        $(this).text('Hide map');
        mapVisible = true;
      }
      $map.slideToggle();
    });

    var $geometry = $('#neighborhood_geometry');
    if ($geometry.val()) var existingGeom = JSON.parse($geometry.val() || '');

    var map = L.map('map', { scrollWheelZoom: false });
    map.setView([47.63, -122.32], 11);
    var layer = L.tileLayer.provider('Stamen.Watercolor');
    layer.addTo(map);

    var drawnItems = L.geoJson(existingGeom)
    map.addLayer(drawnItems);

    var drawControl = new L.Control.Draw({
      draw: { polyline: false, marker: false, circle: false, rectangle: false },
      edit: { featureGroup: drawnItems }
    });

    map.addControl(drawControl);

    var features = [];
    map.on('draw:created', function (e) {
      drawnItems.addLayer(e.layer);
      var layers = drawnItems._layers;
      for (var key in layers) features.push(layers[key].toGeoJSON());
      $geometry.val(JSON.stringify(features))
    });

    map.on('draw:edited', function (e) {
      var layers = drawnItems._layers;
      for (var key in layers) features.push(layers[key].toGeoJSON());
      $geometry.val(JSON.stringify(features))
    });
  }
});