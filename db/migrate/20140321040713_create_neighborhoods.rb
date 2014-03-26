class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.text :description
      t.text :geometry

      t.timestamps
    end
  end
end
