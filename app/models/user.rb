class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  belongs_to :dialect

  def nickname
      name ? name : email.split('@').first
  end
end
