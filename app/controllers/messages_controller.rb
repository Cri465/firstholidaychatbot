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
    intents = response["intents"]
    message = Message.new(conversation: current_conversation, bot: true)
    intents.each do |intent|
      body = case
             when @resolved_traits.values.include?(intent["name"])
               generic_response
             when intent["name"].include?("activity")
               active_resolution(intent["name"])
             when intent["name"].include?("climate")
               climate_resolution(intent["name"])
             when intent["name"].include?("location")
               location_resolution(intent["name"])
             end
      message.body = body
      message.save!
    end
    update_traits
    reply
  end

  def generic_response
    "bones"
  end

  def active_resolution(intent)
    @resolved_traits[:activity] = intent.split('_').last
    @unresolved_traits.delete(:activity)
    Question.activity_response(intent)
  end

  def climate_resolution(intent)
    @resolved_traits[:climate] = intent.split('_').last
    @unresolved_traits.delete(:climate)
    Question.climate_response(intent)
  end

  def location_resolution(intent)
    @resolved_traits[:location] = intent.split('_').last
    @unresolved_traits.delete(:location)
    Question.location_response(intent)
  end

  def update_traits
    current_conversation.unresolved_traits = @unresolved_traits
    current_conversation.resolved_traits = @resolved_traits
    current_conversation.save
  end

  def reply
    if @unresolved_traits.count.positive?
      Message.create(body: Question.random_question(@unresolved_traits), conversation: current_conversation, bot: true)
    else
      suggestion = Location.find_closest_match(@resolved_traits)
      Message.create(body: "This should suit you!", conversation: current_conversation, bot: true, suggestions: suggestion)
      # byebug
    end
  end
end
