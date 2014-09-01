toggle_expenses_form = () ->
    $('#expenses_search_form').toggle()
    $('.expenses-toggle-button').toggle()

$ ->
    if $('#expenses_enable_query').length <= 0
        toggle_expenses_form()

    $('.expenses-toggle-button').click ->
        toggle_expenses_form()
