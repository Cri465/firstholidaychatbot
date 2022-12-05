class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :current_conversation

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    cookies.encrypted[:user_id] = session[:user_id] if @current_user
    @current_user
  end

  def logged_in?
    !!current_user
  end

  def current_conversation
    @current_conversation ||= last_conversation_active? ? current_user.last_conversation : Conversation.create(user: current_user)
  end

  def last_conversation_active?
    return false unless logged_in?
    return false if current_user.conversations.count.zero? || current_user.last_conversation.messages.count.zero?
    return true if TimeDifference.between(current_user.last_conversation.last_message_time, Time.now).in_minutes <= 5
    false
  end
end
