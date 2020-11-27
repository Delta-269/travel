class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :spots
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liked_spots, through: :likes, source: :spot
  validates :name, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

  def already_liked?(spot)
    self.likes.exists?(spot_id: spot.id)
  end
end
