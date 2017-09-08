$(document).ready(function(){
  if($('#map').length > 0){
    var google_map = $('meta[name=google_maps]').attr("content");
    var api_call = `https://maps.googleapis.com/maps/api/js?key=${google_map}&callback=initMap`
    $.getScript(api_call);
  }
})
