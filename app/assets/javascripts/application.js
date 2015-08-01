//= require jquery
//= require jquery_ujs
//= require bootstrap

Backbone.Syphon = require('backbone.syphon');

var LatencyApp = require('latency/application.js');

$(function() {
  (new LatencyApp).start();
});
