class ChatRoom < ApplicationRecord
  has_many :users, -> { uniq }, through: :messages
  has_many :messages, dependent: :destroy
end
