class DropPhotosTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :photos
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
