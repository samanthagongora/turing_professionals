document.addEventListener("turbolinks:load", function(){

$(document).ready(function(){
  if($('div').is('.insights')){
  $.ajax({
    type: 'GET',
    url: '/api/v1/industry_tech?name=Construction',
    success: function(data) {
      var technologies = Object.keys(data)
      var companies = Object.values(data)
      console.log(technologies, companies)
       Highcharts.chart('container-construction-tech', {
         chart: {
             type: 'column'
         },
         title: {
             text: 'Technologies by Number of Construction Companies Using'
         },
         xAxis: {
             categories: technologies,
         },
         yAxis: {
             min: 0,
             title: {
                 text: 'Number of Companies'
             }
         },
         legend: {
             enabled: false
         },
         series: [{
             name: 'Companies',
             data: companies
         }]
       });
     }
   });
 }
 });
});
