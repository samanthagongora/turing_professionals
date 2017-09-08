

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
          colors: [
           '#283044',
           '#216869',
           '#70798C',
           '#7FEFBD',
           '#000000',
           '#C2BBF0',
           '#3590F3',
           '#8FB8ED',
           '#B8336A',
           '#E0BAD7',
           '#5F634F',
           '#DF2935'
         ],

         plotOptions: {
             series: {
                 colorByPoint: true
             }
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
