class AddPriceToLocation < ActiveRecord::Migration[6.1]
  def change
    add_column :locations, :price_per_night, :integer
  end
end
