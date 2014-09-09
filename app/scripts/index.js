'use strict';

var qs = require('querystring');
var $ = require('jquery');

var queryObject = qs.parse(location.search.substring(1));
var username = queryObject.username;

if (username) {
  $('pre').append('loading...');
  $.get('https://api.github.com/users/' + username).then(function(data) {
    $('pre').html(JSON.stringify(data, null, ' '));
  }).fail(function(xhr, status, message) {
    $('pre').html(message);
  });
}
