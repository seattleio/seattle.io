class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :user
  belongs_to :neighborhood
  belongs_to :topic
  has_many :images

  scope :published, -> { where(published: true) }
  scope :recent, -> { order(created_at: :desc) }

  def slug=(value)
    if value.present?
      write_attribute(:slug, value)
    end
  end
end
