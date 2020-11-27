class Spot < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :area
  has_many :comments
  has_many :likes
  has_many :liked_users, through: :likes, source: :user


  def self.search(search)
    if search != ""
      Spot.where('text LIKE(?)', "%#{search}%")
    else
      Spot.all
    end
  end
  
  with_options presence: true do
    validates :title
    validates :category_id
    validates :area_id
    validates :address
    validates :text
    validates :image
  end

  with_options numericality: {other_than: 1 } do
  validates :category_id
  validates :area_id
  end

end
