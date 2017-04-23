class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  belongs_to :dialect

  def nickname
      name ? name : email.split('@').first
  end

  def online
    REDIS.sadd("online", self.nickname)
    AppearanceBroadcastJob.perform_later list
  end

  def offline
    REDIS.srem("online", self.nickname)
    AppearanceBroadcastJob.perform_later list
  end

  def list
    REDIS.smembers("online")
  end
end
