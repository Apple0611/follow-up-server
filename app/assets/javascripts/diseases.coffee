# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  sTab = location.hash.substring 2
  $('.diseases>.show .tabular.menu .item').tab
    history: true,
    cache: false

$(document).ready(ready)
