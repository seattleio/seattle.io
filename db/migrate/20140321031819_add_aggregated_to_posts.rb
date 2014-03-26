class AddAggregatedToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :aggregated, :boolean
  end
end
