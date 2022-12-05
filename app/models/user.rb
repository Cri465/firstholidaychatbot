class User < ApplicationRecord
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_secure_password

  has_many :conversations, foreign_key: :user_id
  has_many :messages, through: :conversations

  def last_conversation
    conversations.last
  end
end
