function validate(controlId, regex, errorProviderControlId, validProviderControlId, minLength) {
	
	var val = 
		document.getElementById(controlId).value;


	console.log(minLength);
	var valid = (regex !== '') ? (new RegExp(regex)).test(val) : (val.length > minLength); 
	console.log(valid);
	
	if(valid) {
		document.getElementById(errorProviderControlId).style.display = 'none';
		document.getElementById(validProviderControlId).style.display = 'inline';
		document.getElementById(controlId).className = 'contact-input valid-input-border';
	} else {
		document.getElementById(errorProviderControlId).style.display = 'inline';		
		document.getElementById(validProviderControlId).style.display = 'none';		
		document.getElementById(controlId).className = 'contact-input invalid-input-border';		
	}
}
