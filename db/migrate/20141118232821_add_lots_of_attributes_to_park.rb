class AddLotsOfAttributesToPark < ActiveRecord::Migration
  def change
    add_column :parks, :park_number, :integer
    add_column :parks, :street_address, :string
    add_column :parks, :zip, :string
    add_column :parks, :acres, :decimal, :precision => 9, :scale => 2
    add_column :parks, :ward, :integer
    add_column :parks, :park_class, :string
    add_column :parks, :lat, :string
    add_column :parks, :lng, :string
  end
end
