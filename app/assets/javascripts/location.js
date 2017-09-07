
$(document).ready(function(){
  if($('#map').length > 0){
    var google_map = $('meta[name=google_maps]').attr("content");
    $.getScript(`http://maps.googleapis.com/maps/api/js?key=${google_map}&callback=initMap`);
  }
})
