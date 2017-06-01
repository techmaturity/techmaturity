// Self running function
(function() {
	Chart.pluginService.register({
		afterDraw: function (chart) {
			if (chart.config.options.elements.center) {
				var helpers = Chart.helpers;
				var centerX = (chart.chartArea.left + chart.chartArea.right) / 2;
				var centerY = (chart.chartArea.top + chart.chartArea.bottom) / 2;

				var ctx = chart.chart.ctx;
				ctx.save();
				var fontSize = helpers.getValueOrDefault(chart.config.options.elements.center.fontSize, Chart.defaults.global.defaultFontSize);
				var fontStyle = helpers.getValueOrDefault(chart.config.options.elements.center.fontStyle, Chart.defaults.global.defaultFontStyle);
				var fontFamily = helpers.getValueOrDefault(chart.config.options.elements.center.fontFamily, Chart.defaults.global.defaultFontFamily);
				var font = helpers.fontString(fontSize, fontStyle, fontFamily);
				ctx.font = font;
				ctx.fillStyle = helpers.getValueOrDefault(chart.config.options.elements.center.fontColor, Chart.defaults.global.defaultFontColor);
				ctx.textAlign = 'center';
				ctx.textBaseline = 'middle';
				ctx.fillText(chart.config.options.elements.center.text, centerX, centerY);
				ctx.restore();
			}
		}
	});
})();

var initCharts = function() {
	var charts = $(".tile-score-chart");
	for(var i = 0; i < charts.length; i++) {
			var chart = charts[i];
			constructChart($(chart));
	}
};

var constructChart = function(chartDiv) {
	var percentage = chartDiv.data()["percentage"];
	var custom_color = "#009CDE";
	if (percentage < 40)
		custom_color = "#F00";
	else if (percentage < 80)
		custom_color = "#FA3";
	else
		custom_color = "#19AB20";

	var data = {
		datasets: [{
			data:[percentage, (100-percentage)],
			backgroundColor:[custom_color, "#F6F7F9"]
		}]
	};

	var doughnutChart = new Chart(chartDiv,{
		type: 'doughnut',
		data: data,
		options: {
			animation: { animateScale:false, animateRotate:false },
			tooltips: {enabled: false},
			responsive: false,
			legend: { display: false },
			elements: {
				center: {
					text: parseFloat(percentage).toFixed(2)+"%",
					fontColor: "#000",
					fontFamily: "'Helvetica Neue', 'Helvetica', 'Arial', sans-serif",
					fontSize: 16,
					fontStyle: 'normal'
				}
			}
		}
	});
};
