class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :note
      t.integer :poly_id
      t.string :poly_type

      t.timestamps
    end
  end
end
