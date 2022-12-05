class ChatbotController < ApplicationController

  def index
    return unless logged_in?
    @message = Message.new
    @messages = current_conversation.messages
    # byebug
  end
end
