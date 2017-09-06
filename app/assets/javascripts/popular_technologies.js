
document.addEventListener("turbolinks:load", function() {
  $(function () {
      var myChart = Highcharts.chart('container-pop-technologies', {
          chart: {
              type: 'bar'
          },
          title: {
              text: 'Most Popular Technologies Used by Members'
          },
          plotOptions: {
            series: {
                shadow:false,
                borderWidth:0,
                dataLabels:{
                    enabled:true,
                    formatter:function() {
                      return Highcharts.numberFormat(this.y,0) + '%';
                    }
                }
            }
        },
          xAxis: {
              categories: ['Ruby', 'Javascript', 'Python'],
          },
          yAxis: {
              title: {
                  text: '% of Members Using '
              },
              labels: {
                formatter: function () {
                  return Highcharts.numberFormat(this.value, 0) + ' %';
                }

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
