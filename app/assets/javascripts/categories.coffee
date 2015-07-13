# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $('.ui.accordion').accordion()
  $('.tabular.menu .item').tab()
  $('.ui.dropdown').dropdown()
  $('.ui.edit.modal').modal('attach events', '#category_edit', 'show')
  $('.ui.delete.modal').modal({
    closable: false
  }).modal('attach events', '#category_delete', 'show')
  $('.ui.checkbox').checkbox()
  $('#category_save_button').click ->
    $('form.category_edit_form').submit()
  $('#category_delete_button').click ->
    $('form.category_delete_form').submit()

  ###
  parent_id = $('input[name="category[parent_id]"]')
  selects = $('select[name="parent_select"]')
  loading = $('<i class="spinner loading icon"></i>')
  save = $('#category_save_button')

  
  selects.change ->
    selecter($(this), true)

  save.click ->
    $('form').submit()

  selecter = (node, origin) ->
    that = if origin then node else $(this)
    span = that.parent().parent()
    span.nextAll().remove()
    span.after(loading)
    $.post '/categories/select', {id: that.val()}, (categories) ->
      if categories.length > 0
        html = """<span><i class="right chevron icon divider"></i>"""
        html += """<select name="category[parent_select]" id="category_parent_select" class: "ui dropdown">"""
        for category in categories
          html += """<option value="#{category.id}">#{category.name}</option>"""
        html += """</select></span>"""
        new_node = $(html)
        span.after(new_node)
        new_node.children('select').dropdown()
        new_node.delegate 'select', 'change', selecter
      parent_id.val(that.val())
      loading.remove()
  ###

$(document).ready(ready)
$(document).on('page:load', ready)
