//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree ../../../vendor/assets/javascripts/.
//= require_tree .
Backbone.Syphon = require('backbone.syphon');

var LatencyApp = require('latency/application.js');

$(function() {
  (new LatencyApp).start();
});
