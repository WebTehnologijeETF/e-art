var validities = {};
var FORM_CONTROL_CNT = 4;

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
		
		validities[controlId] = true;
	} else {
		document.getElementById(errorProviderControlId).style.display = 'inline';		
		document.getElementById(validProviderControlId).style.display = 'none';		
		document.getElementById(controlId).className = 'contact-input invalid-input-border';
		
		validities[controlId] = false;
	}
}

// hard-coded ==> bad

function ajaxValidate() {
	var mjestoVal = 
		document.getElementById('mjesto-input').value;
		
	var postanskiBrojVal = 
		document.getElementById('postanski-broj-input').value;
		
	var xmlhttp=new XMLHttpRequest();
	
	xmlhttp.onreadystatechange=function() {
		if (xmlhttp.readyState==4 && xmlhttp.status==200) {
			var response = JSON.parse(xmlhttp.responseText);
			
			if(Object.keys(response)[0] == 'ok') {
				document.getElementById('mjesto-error-provider').style.display = 'none';
				document.getElementById('mjesto-valid-provider').style.display = 'inline';
				document.getElementById('mjesto-input').className = 'contact-input valid-input-border';
				
				document.getElementById('postanski-broj-error-provider').style.display = 'none';
				document.getElementById('postanski-broj-valid-provider').style.display = 'inline';
				document.getElementById('postanski-broj-input').className = 'contact-input valid-input-border';
					
				validities['mjestoBroj'] = true;
			} else {
				document.getElementById('mjesto-error-provider').style.display = 'inline';
				document.getElementById('mjesto-valid-provider').style.display = 'none';
				document.getElementById('mjesto-input').className = 'contact-input invalid-input-border';
				
				document.getElementById('postanski-broj-error-provider').style.display = 'inline';
				document.getElementById('postanski-broj-valid-provider').style.display = 'none';
				document.getElementById('postanski-broj-input').className = 'contact-input invalid-input-border';
			
				validities['mjestoBroj'] = false;			
			}
		}
	}
	
	xmlhttp.open('GET', 'http://zamger.etf.unsa.ba/wt/postanskiBroj.php?' + 
		'mjesto=' + mjestoVal + '&postanskiBroj=' + postanskiBrojVal, true);
	xmlhttp.send();
}

function isFormSubmitable() {
	
	return true;
	
	var isValid = true;
	
	for (var key in validities) {
		if (validities.hasOwnProperty(key)) {
			if(!validities[key]) {
				isValid = false;
			}
		}
	}
	
	return Object.keys(validities).length == FORM_CONTROL_CNT &&
		isValid;
		
}
