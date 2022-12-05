class AddBotFlagToMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :bot, :boolean, default: false
  end
end
