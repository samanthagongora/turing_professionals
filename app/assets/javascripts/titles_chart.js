document.addEventListener("turbolinks:load", function(){

$(document).ready(function(){
  if($('div').is('.insights')){
  $.ajax({
    type: 'GET',
     url: 'http://localhost:3000/api/v1/workplaces/titles',
     success: function(data) {
       var chartData = []

       $.each(data, function (index, dataItem){
         chartData.push({name: dataItem.title,
                        y: dataItem.count})
       })
       Highcharts.chart('container-job-titles', {
     chart: {
         plotBackgroundColor: null,
         plotBorderWidth: null,
         plotShadow: false,
         type: 'pie'
     },
     title: {
         text: 'Current Job Titles of Turing Professional Members'
     },
     tooltip: {
         pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
     },
     plotOptions: {
         pie: {
             allowPointSelect: true,
             cursor: 'pointer',
             dataLabels: {
                 enabled: true,
                 format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                 style: {
                     color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                 }
             }
         }
     },
     series: [{
         name: 'job titles',
         colorByPoint: true,
         data: chartData
     }]
 });
          }
        })
      }
      });
      });
