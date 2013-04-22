var icons = {
  "build":"ui-icon-wrench",
  "exec":"ui-icon-gear",
  "generate":"ui-icon-calculator",
  "local_exec":"ui-icon-gear",
  "known":"ui-icon-document",
  "transliterate":"ui-icon-pencil"
}
function clear_console(){$('#output').html('');}
function run_task(task_name){	
  clear_console();
  disable_or_enable_buttons(true);
	$.ajax({
    		url: '/'+task_name,
    		dataType: 'json',
    		data: $("form#data").serialize(),
    		type: 'POST',
    		success: function(data){    			
          $('#console').attr('src',"/result.html");
          disable_or_enable_buttons(false);
    		}
    	})
}
$( function() { 
  $( "button" ).each(function(index){
    $(this).button({ icons:{ primary: icons[this.id] } });
    $(this).click( function(){ run_task(this.id) } );
  })
});
function disable_or_enable_buttons(disable_attr_value){
  $("button").each(function(index){
    $(this).attr('disabled', disable_attr_value);
  })
}
