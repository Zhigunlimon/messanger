class ChatRoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_rooms_#{params['chat_room_id']}_channel"
  end

  def unsubscribed
  end

  def send_message(data)
    message = MessageTranslateService.translate(data['message'], current_user.dialect.api_name)
    current_user.messages.create!(body: message, chat_room_id: data['chat_room_id'])
  end
end
