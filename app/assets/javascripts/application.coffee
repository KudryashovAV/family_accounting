#= require jquery
#= require jquery_ujs
#= require bootstrap-sprockets
#= require dynamic-fields-for
#= require bootstrap-datepicker



$ ->
  $('.datepicker').datepicker format: 'dd/mm/yyyy'
  return

$ ->
  $('.purchase-product-select').select2();
