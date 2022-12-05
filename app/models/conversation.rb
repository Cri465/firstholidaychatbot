class Conversation < ApplicationRecord
  belongs_to :user, foreign_key: :user_id, class_name: 'User'
  has_many :messages, dependent: :destroy
end
