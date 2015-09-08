# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->

  $('#department_save_button').click ->
    $('form.department_basic_form').submit()
  $('#department_delete_modal').modal({
    closable: false
  }).modal('attach events', '#department_delete_button', 'show')

$(document).ready(ready)
$(document).on('page:load', ready)
