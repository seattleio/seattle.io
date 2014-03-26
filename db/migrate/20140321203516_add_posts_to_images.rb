class AddPostsToImages < ActiveRecord::Migration
  def change
    add_reference :images, :post, index: true
  end
end
