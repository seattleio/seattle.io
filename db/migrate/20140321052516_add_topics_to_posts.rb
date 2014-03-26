class AddTopicsToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :topic, index: true
  end
end
