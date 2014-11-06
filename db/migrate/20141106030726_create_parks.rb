class CreateParks < ActiveRecord::Migration
  def change
    create_table :parks do |t|
      t.string :name
      t.integer :neighborhood_id
      t.text :description

      t.timestamps
    end
  end
end
