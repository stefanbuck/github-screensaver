'use strict';

require('impress');

var instance = impress('stage');
instance.init();
setInterval(instance.next, 2000);
