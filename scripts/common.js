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

var objectInstance = new $('asd');
console.log($.width);
$.width = 3;
console.log($.width);