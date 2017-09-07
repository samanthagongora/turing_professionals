document.addEventListener("turbolinks:load", function(){

$(document).ready(function(){
  if($('div').is('.insights')){
  $.ajax({
    type: 'GET',
    url: 'http://localhost:3000/api/v1/technologies/most_popular',
     success: function(data) {
       var categories = []
       var backendData = []
       var frontendData = []

        $.each(data, function (index, dataItem) {
          categories.push(dataItem.name)
          backendData.push(dataItem.back_end_users)
          frontendData.push(dataItem.front_end_users)
        })
        Highcharts.chart('container-pop-technologies', {
            chart: {
                type: 'bar'
            },
            title: {
                text: 'Most Popular Technologies Used by Turing Professionals Members'
            },
            xAxis: {
                categories: categories,
            },
            yAxis: {
                title: {
                    text: '# of Members Using '
                },
            },
            plotOptions: {
                series: {
                    stacking: 'normal'
                }
            },
            series: [{
                name: 'Backend Program Graduates',
                data: backendData
            }, {
                name: 'Frontend Program Graduates',
                data: frontendData
            }]
        });
      }
  });
}
});
});
