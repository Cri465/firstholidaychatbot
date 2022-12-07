class DropLocations < ActiveRecord::Migration[6.1]
  def up
    drop_table :locations
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
