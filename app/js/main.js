var getUrlVars = function() {
  var vars = [], hash;
  var hashes = location.search.slice(location.search.indexOf('?') + 1).split('&');
  for(var i = 0; i < hashes.length; i++)
  {
    hash = hashes[i].split('=');
    vars.push(hash[0]);
    vars[hash[0]] = hash[1];
  }
  return vars;
};

$(function() {
  var qs = getUrlVars();
  var username = qs['username'];

  if(username) {
    $('pre').append('loading...');
    $.get('https://api.github.com/users/' + username).then(function(data) {
      $('pre').html(JSON.stringify(data, null, ' '));
    }).fail(function(xhr, status, message) {
      $('pre').html(message);
    });
  }
});
