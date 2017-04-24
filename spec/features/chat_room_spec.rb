require 'rails_helper'

feature 'chat room' do
  let(:user) { create(:user, dialect: dialect) }
  let(:dialect) { create(:dialect) }
  let(:chat_room) { create(:chat_room) }
  let!(:messages) { create_list(:message, 2, user: user, chat_room: chat_room) }

  before :each do
    sign_in_user(user)
  end

  it 'shows user plan' do
    visit chat_room_path(chat_room)
    expect(page).to have_content(messages.last.body)
  end
end
