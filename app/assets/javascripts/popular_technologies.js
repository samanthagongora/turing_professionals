$(document).ready(function(){
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
                text: 'Most Popular Technologies Used by Members'
            },
            xAxis: {
                categories: categories,
            },
            yAxis: {
                title: {
                    text: '# of Members Using '
                },
            },
            series: [{
                name: 'Backend',
                data: backendData
            }, {
                name: 'Frontend',
                data: frontendData
            }]
        });
      }
  });
})
