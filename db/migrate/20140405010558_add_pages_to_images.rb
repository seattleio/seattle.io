class AddPagesToImages < ActiveRecord::Migration
  def change
    add_reference :images, :page, index: true
  end
end
