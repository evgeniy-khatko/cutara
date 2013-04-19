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

$(document).ready(function(){
    $(".rake_task").mousedown(function(){
        var mrgtb = parseInt($(this).css("margin-top"));
        var mrglf = parseInt($(this).css("margin-left"));
        mrgtb=mrgtb+3;
        mrglf=mrglf+3;
            $(this).css("margin-top",mrgtb+"px").css("margin-left",mrglf+"px");
    }).mouseup(function(){
        var mrgtb = parseInt($(this).css("margin-top"));
        var mrglf = parseInt($(this).css("margin-left"));
        mrgtb=mrgtb-3;
        mrglf=mrglf-3;
            $(this).css("margin-top",mrgtb+"px").css("margin-left",mrglf+"px");
    }); 
});
