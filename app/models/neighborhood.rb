class Neighborhood < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_many :posts
  has_many :images

  def slug=(value)
    if value.present?
      write_attribute(:slug, value)
    end
  end
end
