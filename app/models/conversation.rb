class Conversation < ApplicationRecord
  belongs_to :user, foreign_key: :user_id, class_name: 'User'
  has_many :messages, dependent: :destroy
  after_save :initial_message

  def last_message_time
    messages.last.created_at
  end

  def initial_message
    sleep 0.2
    Message.create(body: "Hello! I'm Wanderer. I help people get to where they need to go. I can help you decide on a holiday destination!", conversation: self, bot: true)
    Message.create(body: "First question! Do you want to relax or go on adventures?", conversation: self, bot: true)
  end
end
