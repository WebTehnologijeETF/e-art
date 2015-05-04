var validities = {};
var FORM_CONTROL_CNT = 3;

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

function isFormSubmitable() {
	
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

// ============================
var allItems = [];

// back-end

function getAllItems(isFirst) {
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange=function() {
		if (xmlhttp.readyState==4 && xmlhttp.status==200) {
			allItems = JSON.parse(xmlhttp.responseText);
			generateTable(allItems);
		}
	}
	
	// sync on page load...
	xmlhttp.open(
		'POST', 
		'http://zamger.etf.unsa.ba/wt/proizvodi.php?brindexa=16259', 
		!isFirst
	);
	xmlhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	xmlhttp.send('');
}

function addItem(item) {
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange=function() {
		if (xmlhttp.readyState==4 && xmlhttp.status==200) {
			console.log(xmlhttp.responseText);
			
			getAllItems();
		}
	}
	
	
	xmlhttp.open(
		'POST', 
		'http://zamger.etf.unsa.ba/wt/proizvodi.php?brindexa=16259', 
		true
	);
	xmlhttp.setRequestHeader('Content-type','application/x-www-form-urlencoded');
	xmlhttp.send('akcija=dodavanje&proizvod=' + JSON.stringify(item));
}

function removeItem(item) {
	console.log('removing...');
	console.log(item);
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange=function() {
		if (xmlhttp.readyState==4 && xmlhttp.status==200) {
			getAllItems();
		}
	}
	
	
	xmlhttp.open(
		'POST', 
		'http://zamger.etf.unsa.ba/wt/proizvodi.php?brindexa=16259', 
		true
	);
	xmlhttp.setRequestHeader('Content-type','application/x-www-form-urlencoded');
	xmlhttp.send('akcija=brisanje&proizvod=' + JSON.stringify(item));
}

function editItem(item) {
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange=function() {
		if (xmlhttp.readyState==4 && xmlhttp.status==200) {
			console.log(xmlhttp.responseText);
			
			getAllItems();
		}
	}
	
	
	xmlhttp.open(
		'POST', 
		'http://zamger.etf.unsa.ba/wt/proizvodi.php?brindexa=16259', 
		true
	);
	xmlhttp.setRequestHeader('Content-type','application/x-www-form-urlencoded');
	xmlhttp.send('akcija=promjena&proizvod=' + JSON.stringify(item));
}

// front-end

function editFromForm(arrayIndex) {
	allItems[arrayIndex].naziv = document.getElementById('name-' + arrayIndex).value;
	allItems[arrayIndex].opis = document.getElementById('desc-' + arrayIndex).value;
	allItems[arrayIndex].slika = document.getElementById('img-' + arrayIndex).value;
	
	editItem(allItems[arrayIndex]);
}


// hard-coded
function addFromForm() {
	if(!isFormSubmitable) {
		alert('Form not valid!!!');
	} else {
		var item = {
			id: allItems.length + 2,
			naziv : document.getElementById('naziv-input').value,
			opis : document.getElementById('opis-input').value,
			slika : document.getElementById('slika-input').value
		};
		addItem(item);
	}
}

function removeFromForm(arrayIndex) {
	removeItem(allItems[arrayIndex]);
}

function addTableRow(name, desc, imageUrl, arrayIndex) {
	var newRow = 
		document.createElement('div');
	newRow.className = 'row row-10';
	
	var nameDiv = document.createElement('div');
	nameDiv.className = 'col col-25';
	nameDiv.innerHTML = '<input id="name-' + arrayIndex + '" class="wide-input" type="text" value="' + name + '">';
	
	var descDiv = document.createElement('div');
	descDiv.className = 'col col-25';
	descDiv.innerHTML = '<input id="desc-' + arrayIndex + '" class="wide-input" 	type="text" value="' + desc + '">'
	
	var imgDiv = document.createElement('div');
	imgDiv.className = 'col col-25';
	imgDiv.innerHTML = '<img id="img-' + arrayIndex + '"class="artwork-preview" src="' + imageUrl + '" alt="hh">';
	
	var optionsDiv = document.createElement('div');
	optionsDiv.className = 'col col-25';
	optionsDiv.innerHTML  = 
		'<button onclick="editFromForm(' + arrayIndex + ');">Edit</button>' + 
		'<button onclick="removeFromForm(' + arrayIndex + ');">Remove</button>';

	newRow.appendChild(nameDiv);
	newRow.appendChild(descDiv);
	newRow.appendChild(imgDiv);
	newRow.appendChild(optionsDiv);
	
	var tableElement = document.getElementById('table');
	tableElement.appendChild(newRow);
	
	var horizontalLine = document.createElement('hr');
	tableElement.appendChild(horizontalLine);
}

function generateTable(items) {
	console.log('generating table...');
	console.log(allItems);
	
	var tableElement = document.getElementById('table');
	tableElement.innerHTML = '';
	
	for(var i = 0; i < allItems.length; i++) {
		addTableRow(allItems[i].naziv, allItems[i].opis, allItems[i].slika, i);
	}
}

// initial

getAllItems(true);
generateTable(allItems);


