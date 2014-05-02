class AddCommunitiesToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :community, index: true
  end
end
