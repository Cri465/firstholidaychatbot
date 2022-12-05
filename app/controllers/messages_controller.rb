class MessagesController < ApplicationController

  def create
    # byebug
    Message.create(body: params[:message][:body], conversation: current_user.last_conversation)
    render message
  end
end
