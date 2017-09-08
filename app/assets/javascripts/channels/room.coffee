App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
# Called when the subscription is ready for use on the server

  disconnected: ->
# Called when the subscription has been terminated by the server

  received: (data) ->
    alert('You have a new mention') if data.mention
    if (data.message && !data.message.blank?)
      $('#messages-table').append data.message

$(document).ready ->
  submit_message()

submit_message = () ->
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13 && !event.shiftKey
      $('input#submit').click()
      event.target.value = ""
      event.preventDefault()

