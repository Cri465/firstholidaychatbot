class Recreate < ActiveRecord::Migration[6.1]
    def change
    create_table :locations do |t|
      t.string "hotel_name"
      t.text "description"
      t.string "tags"
      t.string "geodata"
      t.integer "state", default: 1
      t.integer "star_rating", default: 1
    end
  end
end
