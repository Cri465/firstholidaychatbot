class MessagesController < ApplicationController

  def create
    @message = Message.create(body: params[:message][:body], conversation: current_conversation)
    traits
    process_message
  end

  private

  def traits
    @unresolved_traits = current_conversation.unresolved_traits
    @resolved_traits = current_conversation.resolved_traits
  end

  def process_message
    response = wit_client.message(@message.body)
    p response
    intents = response["intents"]
    intents.each do |intent|
      body = case
             when @resolved_traits.values.include?(intent["name"])
               generic_response
             when intent["name"].include?("activity")
               active_resolution(intent["name"])
             when intent["name"].include?("climate")
               climate_resolution(intent["name"])
             when intent["name"].include?("setting")
               setting_resolution(intent["name"])
             end
      Message.create(body: body, conversation: current_conversation, bot: true)
    end
    update_traits
    reply
  end

  def generic_response
    "bones"
  end

  def active_resolution(intent)
    @resolved_traits[:activity] = intent
    @unresolved_traits.delete(:activity)
    Question.activity_response(intent)
  end

  def climate_resolution(intent)
    @resolved_traits[:climate] = intent
    @unresolved_traits.delete(:climate)
    Question.climate_response(intent)
  end

  def setting_resolution(intent)
    @resolved_traits[:setting] = intent
    @unresolved_traits.delete(:setting)
    Question.setting_response(intent)
  end

  def update_traits
    current_conversation.unresolved_traits = @unresolved_traits
    current_conversation.resolved_traits = @resolved_traits
    current_conversation.save
  end

  def reply
    # traits
    # Message.create(body: @resolved_traits, conversation: current_conversation, bot: true)
  end


end
