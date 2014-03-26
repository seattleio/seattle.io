class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :caption
      t.text :credits

      t.timestamps
    end
  end
end
