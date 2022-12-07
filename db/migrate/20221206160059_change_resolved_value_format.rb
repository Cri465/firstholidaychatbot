class ChangeResolvedValueFormat < ActiveRecord::Migration[6.1]
  def change
    change_table :conversations do |t|
      t.remove :resolved_traits
      t.string :resolved_traits, default: "{}"
    end
  end
end
