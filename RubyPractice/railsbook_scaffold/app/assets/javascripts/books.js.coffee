# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("#testbutton").on('click', ->
    result = util_get_input_value($("#dateselect"),"dateselect")
    alert "result"+result
  )
