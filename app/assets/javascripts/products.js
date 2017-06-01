$(document).ready(function() {
	$('#assess-check').change(function() {
		var assessed = this.checked;
		$.ajax({
		  url: '/products?assessed=' + (assessed ? '1' : '0'),
		  async: true,
		  dataType: 'script'
		});
	});
	$('#search-tags').on('input', function() {
		var searchValue = $(this).val();
		var assessed = ($('#assess-check').is(':checked')) ? '1' : '0';
		$.ajax({
			url: '/products?q=' + searchValue + '&assessed=' + assessed,
			async: true,
			dataType: 'script'
		})
	});
	initCharts();
});
