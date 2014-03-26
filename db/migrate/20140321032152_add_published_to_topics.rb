class AddPublishedToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :published, :boolean
  end
end
