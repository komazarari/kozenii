$ ->
    $('#incomes_search_form').hide()

    $('.incomes-toggle-button').click ->
        $('#incomes_search_form').toggle()
        $('.incomes-toggle-button').toggle()
