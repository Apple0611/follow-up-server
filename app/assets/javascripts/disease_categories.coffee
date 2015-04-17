# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $('.ui.accordion').accordion()
  $('.tabular.menu .item').tab()
  $('.ui.dropdown').dropdown()
  $('.ui.modal').modal('attach events', '#category_edit', 'show')
  $('.ui.checkbox').checkbox()

$(document).ready(ready)
$(document).on('page:load', ready)
