class Message < ApplicationRecord
  belongs_to :conversation, foreign_key: :conversation_id, class_name: 'Conversation'
  has_one :user, through: :conversation
  validates_presence_of :body, :user, :conversation
  before_validation :set_attr
  after_save :broadcast

  def suggestions
    return nil if self[:suggestions].nil?
    eval self[:suggestions]
  end

  private

  def set_attr
    write_attribute(:user_id, conversation.user_id)
  end

  def broadcast
    # byebug
    ConversationChannel.broadcast_to Message.last.conversation.id, message_render(self)
  end



  def message_render(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end

end
