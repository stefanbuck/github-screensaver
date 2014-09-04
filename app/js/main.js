$(function() {
	$('pre').append('loading...');

	var username = location.hash.replace('#','');
	username = 'stefan';
	$.get('https://api.github.com/users/' + username).then(function(data) {
		$('pre').html(JSON.stringify(data, null, ' '));
	}).fail(function(xhr, status, message) {
		$('pre').html(message);
	});
});
