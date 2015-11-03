#= require jquery
#= require jquery_ujs
#= require bootstrap-sprockets
#= require dynamic-fields-for
#= require bootstrap-datepicker
#= require underscore
#= require show-on-value

$ ->
  $('.datepicker').datepicker format: 'dd/mm/yyyy'
  return
