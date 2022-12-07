class ChangeLocationTags < ActiveRecord::Migration[6.1]
  def change
    change_table :locations do |t|
      t.remove :tags
      t.string :traits, default: "{}"
    end
  end
end
