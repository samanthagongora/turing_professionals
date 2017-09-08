

$(document).ready(function(){
  if($('div').is('.insights')){
  $.ajax({
    type: 'GET',
    url: '/api/v1/user_locations/everywhere',
     success: function(data) {
       var locations = Object.keys(data)
       var members = Object.values(data)

        Highcharts.chart('container-cities', {
          chart: {
              type: 'column'
          },
          title: {
              text: 'Cities Where Turing Students Have Lived After Graduation'
          },
          xAxis: {
              categories: locations,
          },
          yAxis: {
              min: 0,
              title: {
                  text: 'Number of Members'
              }
          },
          legend: {
              enabled: false
          },
          series: [{
              name: 'Students',
              data: members
          }]
        });
      }
    });
  }
  });
