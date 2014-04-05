class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :full_name, use: :slugged

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :images

  def full_name
    [first_name, last_name].join(' ')
  end

  def admin?
    self.admin
  end

end
