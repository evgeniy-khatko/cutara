function clear_console(){$('#output').html('');}
function run_task(task_name){	
  clear_console();
	$.ajax({
    		url: '/'+task_name,
    		dataType: 'json',
    		data: $("form#data").serialize(),
    		type: 'POST',
    		success: function(data){    			
          $('#output').html(data['result']);
    		}
    	})
}
