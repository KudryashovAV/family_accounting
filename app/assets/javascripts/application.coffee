#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require bootstrap-sprockets
#= require dynamic-fields-for
#= require bootstrap-datepicker
#= require underscore
#= require show-on-value
#= require select2


$ ->
  $('.datepicker').datepicker format: 'dd/mm/yyyy'
  return

$ ->
  $('.purchase-product-select').select2();


$('a.glyphicon.glyphicon-plus').click ->
  $('#purchase_form').submit()
  return

$('a.glyphicon.glyphicon-plus').click ->
  $('#cost_form').submit()
  return
