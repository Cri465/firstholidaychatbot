class ConversationChannel < ApplicationCable::Channel
  def subscribed
    reject unless params[:conversation_id]
    conversation = Conversation.find(params[:conversation_id])
    stream_for conversation.id
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
