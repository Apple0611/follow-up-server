ready = ->
  $('.message-box .close.icon').click ->
    $(this).parents('.message-box').hide()

$(document).ready(ready)
$(document).on('page:load', ready)