class CreateSports < ActiveRecord::Migration
  def change
    create_table :sports do |t|
      t.string :name
      t.text :description
      t.integer :players

      t.timestamps
    end
  end
end
