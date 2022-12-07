class ChangeUnresolvedTraits < ActiveRecord::Migration[6.1]
  def change
    change_table :conversations do |t|
      t.remove :unresolved_traits
      t.string :unresolved_traits, default: "{activity: nil, climate: nil ,location: nil}"
    end
  end
end
