class AddStarratingToLocations < ActiveRecord::Migration[6.1]
  def change
    add_column :locations, :star_rating, :integer
  end
end
