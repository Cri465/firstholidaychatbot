class Message < ApplicationRecord
  belongs_to :conversation, foreign_key: :conversation_id, class_name: 'Conversation'
  has_one :user, through: :conversation
  validates_presence_of :body, :user, :conversation
  before_validation :set_attr

  private

  def set_attr
    write_attribute(:user_id, conversation.user_id)
  end
end
