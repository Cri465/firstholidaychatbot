class AddTraitFieldsToConversation < ActiveRecord::Migration[6.1]
  def change
    add_column :conversations, :resolved_traits, :string
    add_column :conversations, :unresolved_traits, :string, default: "{activity: nil, climate: nil ,setting: nil ,price: nil}"
  end
end
