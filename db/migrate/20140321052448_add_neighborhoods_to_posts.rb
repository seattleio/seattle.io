class AddNeighborhoodsToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :neighborhood, index: true
  end
end
