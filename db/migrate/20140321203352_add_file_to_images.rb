class AddFileToImages < ActiveRecord::Migration
  def self.up
    add_attachment :images, :file
  end

  def self.down
    remove_attachment :images, :file
  end
end
