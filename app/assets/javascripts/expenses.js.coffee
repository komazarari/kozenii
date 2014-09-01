$ ->
    $('#expenses_search_form').hide()

    $('.expenses-toggle-button').click ->
        $('#expenses_search_form').toggle()
        $('.expenses-toggle-button').toggle()
