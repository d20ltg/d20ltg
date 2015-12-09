$ ->
  console.log 'expansion javascript loaded'

  $('.expansion-button').each ->
    $(this).click ->
      $('#expansion_set_name').val $(this).text()
      $('#expansion_set_abbreviation').val $(this).attr('id')

  $('#expansion_set_name').on 'input', ->
    searchString = $(this).val().toLowerCase().replace /^\s+/g, ''

    if searchString == ''
      $('.expansion-button').each ->
        $(this).show()
    else
      $('.expansion-button').each ->
        button = $(this)
        setName = button.text().toLowerCase()
        if setName.indexOf(searchString) >= 0
          button.show()
        else
          button.hide()
