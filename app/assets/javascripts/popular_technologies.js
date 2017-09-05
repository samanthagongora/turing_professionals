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
              categories: ['Ruby', 'Javascript', 'Python']
          },
          yAxis: {
              title: {
                  text: '% of Members Using '
              }
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
