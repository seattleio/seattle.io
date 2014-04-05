class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :images

  def slug=(value)
    if value.present?
      write_attribute(:slug, value)
    end
  end
end
