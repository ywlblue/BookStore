// The setCustomValidity only triggered in form submitting
function checkItem(obj){
	switch($(obj).attr('name')) {
		case "username":
			if ($(obj).val() != ""){ // use AJAX pass the username to servlet 
				var url="CheckUserName?username="+ encodeURI($(obj).val()) + "&" + new Date().getTime();
				$.get(url, function(data){
					if(data == "false") {
						 obj.setCustomValidity('Username exists.');
					} else {
						 obj.setCustomValidity('');
					}
				});
			}
			break;
		case "re-password":
			if ($(obj).val() != ""){
				if ($(obj).val() != document.getElementById('password').value) {
		        	// display error msg at submission
		            obj.setCustomValidity('Password Must be Matching.');
		        } else {
		            // input is valid -- reset the error message
		            obj.setCustomValidity('');
		        }
			}
			break;
		default:
			break;
	}
}