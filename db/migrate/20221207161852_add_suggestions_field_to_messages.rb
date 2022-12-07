class AddSuggestionsFieldToMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :suggestions, :string
  end
end
