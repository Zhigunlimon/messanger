class ChatRoom < ApplicationRecord
  has_many :users, -> { uniq }, through: :messages
  has_many :messages, -> { order(created_at: :asc) }, dependent: :destroy
end
