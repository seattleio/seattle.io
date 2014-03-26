class AddNeighborhoodsToImages < ActiveRecord::Migration
  def change
    add_reference :images, :neighborhood, index: true
  end
end
