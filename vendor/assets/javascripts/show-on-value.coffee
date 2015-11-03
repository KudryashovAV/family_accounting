$.fn.extend
  showOnValue: ->
    $(@).each (i, el) ->
      new ShowOnValue($(el))

class ShowOnValue
  constructor: ($input) ->
    @init($input)

  init: ($input) ->
    @$input = $input
    @dependencies = {}
    for dependency, values of $input.data('showOnValue')
      values = [values] unless _.isArray(values)
      @dependencies[dependency] = values

    $input.on 'change', =>
      value = @read_value()
      for dependency, values of @dependencies
        $("[data-show-on-value-id=#{dependency}]").toggle(_.include(values, value))

    $input.trigger 'change'

  read_value: ->
    if @$input.attr('type') == 'checkbox'
      @$input.prop('checked')
    else
      @$input.val()

$(document).on 'ready page:load', ->
  $('[data-show-on-value]').showOnValue()
