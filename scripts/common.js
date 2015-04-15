/*

	class - DOM object
	properties:
		width
		height
		visible
	
	methods:
		animateProperty -- linear
		hide
		show
		

*/

function $(parameter) {
	this.width123 = 5;
	
	console.log('object created.');
}

Object.defineProperty(
	$,
	'width',
	{
		get: function() {
			return this.width123;
		},
		set: function(newWidth) {
			this.width123 = newWidth;
		}		
	}
);

$.post = function() {
	console.log('post');
};

$.get = function() {
	console.log('get');
};		

function showSearch() {
	var items = document.getElementsByClassName('search-help-row');
	console.log('==1==');
	for(i = 0; i < items.length; i++) {
		items[i].className = 'search-help-row visible';
	}
}

function hideSearch() {
	var items = document.getElementsByClassName('search-help-row');
	console.log('==1==');
	for(i = 0; i < items.length; i++) {
		items[i].className = 'search-help-row invisible';
	}
}

