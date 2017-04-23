class AppearanceBroadcastJob < ApplicationJob
  queue_as :default

  def perform(list)
    ActionCable.server.broadcast 'appearance_channel', appearances: render_list(list)
  end

	private
  #########################################################################

  def render_list(list)
    MessagesController.render partial: 'chat_rooms/user_list',
      locals: { list: list }
  end
end
