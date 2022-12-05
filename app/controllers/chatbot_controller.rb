class ChatbotController < ApplicationController

  def index
    @message = Message.new
    @messages = current_conversation.messages
    # byebug
  end

  def current_conversation
    @current_conversation = Conversation.create(user: current_user)
  end
end
