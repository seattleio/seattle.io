class AddCommunitiesToImages < ActiveRecord::Migration
  def change
    add_reference :images, :community, index: true
  end
end
