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
      }
  });
})


document.addEventListener("turbolinks:load", function() {
  $(function () {
      var myChart = Highcharts.chart('container-pop-technologies', {
          chart: {
              type: 'bar'
          },
          title: {
              text: 'Most Popular Technologies Used by Members'
          },
          xAxis: {
              categories: ['Ruby', 'Javascript', 'Python'],
          },
          yAxis: {
              title: {
                  text: '# of Members Using '
              },
          },
          series: [{
              name: 'Backend',
              data: [1, 0, 4]
          }, {
              name: 'Frontend',
              data: [1, 7, 3]
          }]
      });
  });

})
