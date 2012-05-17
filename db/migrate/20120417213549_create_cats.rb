class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :image
      t.integer :yesvotes
      t.integer :totalvotes

      t.timestamps
    end
  end
end
