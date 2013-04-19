function clear_console(){$('#output').html('');}
function build(){	
  clear_console();
	$.ajax({
    		url: '/build',
    		dataType: 'json',
    		data: $("form#data").serialize(),
    		type: 'POST',
    		success: function(data){    			
          $('#output').html(data['result']);
    		}
    	})
}
