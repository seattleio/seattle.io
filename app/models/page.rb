class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :images
end
