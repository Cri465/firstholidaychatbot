class Conversation < ApplicationRecord
  belongs_to :user, foreign_key: :user_id, class_name: 'User'
  has_many :messages, dependent: :destroy
  after_create :initial_message


  def last_message_time
    messages.last.created_at
  end

  def initial_message
    sleep 2
    Message.create(body: "Hello! I'm Wanderer. I help people get to where they're going. I can help you decide on a holiday destination!", conversation: self, bot: true)
    Message.create(body: Question.random_question(self.unresolved_traits), conversation: self, bot: true)
  end

  def resolved_traits
    eval self[:resolved_traits]
  end

  def unresolved_traits
    eval self[:unresolved_traits]
  end

end
