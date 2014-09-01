toggle_incomes_form = () ->
    $('#incomes_search_form').toggle()
    $('.incomes-toggle-button').toggle()

$ ->
    if $('#incomes_enable_query').length <= 0
        toggle_incomes_form()

    $('.incomes-toggle-button').click ->
        toggle_incomes_form()
