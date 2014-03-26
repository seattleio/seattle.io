class AddTopicsToImages < ActiveRecord::Migration
  def change
    add_reference :images, :topic, index: true
  end
end
