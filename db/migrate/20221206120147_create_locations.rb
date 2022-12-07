class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string "HotelName"
      t.text "Description"
      t.string "Tags"
      t.string "Geodata"
      t.integer "State", default: 1
    end
  end
end
