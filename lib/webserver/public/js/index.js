var icons = {
  "build":"ui-icon-wrench",
  "exec":"ui-icon-gear",
  "generate":"ui-icon-calculator",
  "local_exec":"ui-icon-gear",
  "known":"ui-icon-document",
  "transliterate":"ui-icon-pencil"
}
function clear_console(){$('#console').attr('src',"");}
function run_task(task_name){	
  target_url = '/'+task_name;
  clear_console();
  disable_or_enable_buttons(true);
	$.ajax({
    		url: target_url,
    		dataType: 'json',
    		data: $("form#data").serialize(),
    		type: 'POST',
        dataType: 'json',
        contentType: "application/json",
        async: true,
    		success: function(data){    			
          $('#console').attr('src',"/result.html");
          disable_or_enable_buttons(false);
    		},
        error: function(XMLHttpRequest, textStatus, errorThrown) { errorPost(textStatus, errorThrown); }
    	})
}
$( function() { 
  $( "button" ).each(function(index){
    $(this).button({ icons:{ primary: icons[this.id] } });
    $(this).click( function(){ run_task(this.id); return( false ) } );
  })
});
function disable_or_enable_buttons(disable_attr_value){
  $("button").each(function(index){
    $(this).attr('disabled', disable_attr_value);
  })
}
