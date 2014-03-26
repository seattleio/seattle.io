class Image < ActiveRecord::Base
  has_attached_file(
    :file, 
    :styles => {
      :wide => "1200x600#", 
      :medium => "600x400#", 
      :medium => "300x300#", 
      :thumb => "100x100#"
    }, 
    :default_url => "/images/:style/missing.png"
  )

  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/

  belongs_to :post
  belongs_to :page
  belongs_to :user
  belongs_to :topic
  belongs_to :neighborhood
end
