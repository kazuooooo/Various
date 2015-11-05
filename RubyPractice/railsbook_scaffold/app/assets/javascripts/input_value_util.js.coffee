@util_get_input_value = (element,type) ->
  switch type
    #テキストフィールド
    when "text"
      $(element).val()
    #チェックボックス
    when "checkbox"
      $(element).prop('checked')
    #ラジオボタン
    when "radiobutton"
      get_radio_button_val(element)
    #日付
    when "dateselect"
      get_dateselect_val(element)

    else "others"

get_radio_button_val = (element) ->
  className = $(element).attr('class')
  radio_buttons = document.getElementsByClassName(className)
  for radio_button in radio_buttons
    if radio_button.checked
      return radio_button.value
  return "no checked"