document.addEventListener("turbolinks:load", function() {
  $(function () {
      var myChart = Highcharts.chart('container', {
    chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
    },
    title: {
        text: 'Current Job Titles of Turing Professionals'
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
        data: [{
            name: 'Microsoft Internet Explorer',
            y: 10
        }, {
            name: 'Chrome',
            y: 10,
        }, {
            name: 'Firefox',
            y: 10
        }, {
            name: 'Safari',
            y: 5
        }, {
            name: 'Opera',
            y: 1
        }, {
            name: 'Proprietary or Undetectable',
            y: 1
        }]
    }]
});
});
});
