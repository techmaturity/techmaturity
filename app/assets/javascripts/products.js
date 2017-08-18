$(document).ready(function() {
	
	  $('#assess-check').change(function() {
		var searchValue = $('#search-tags').val();
		var assessed = this.checked? '1' : '0';
		var path = '/products?assessed=' + (assessed);
		if (searchValue) {
		  path += "&q=" + searchValue;
		}
		$.ajax({
		  url: path,
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
	