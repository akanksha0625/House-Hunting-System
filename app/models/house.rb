class House < ApplicationRecord
  #attr_accessible :image
  # belongs_to :user

  mount_uploader :image, ImageUploader
  has_many :inquiries

  validates :location, presence: true
  validates :square_footage, presence: true, numericality: true
  validates :year_built, presence: true, numericality: true
  validates :style, presence: true
  validates :list_price, presence: true, numericality:true
  validates :no_of_floors, presence: true, numericality: true
  validates :basement, inclusion: { in: [true, false] }
  validates :current_house_owner, presence: true
  validates :contact_info, presence: true
end
