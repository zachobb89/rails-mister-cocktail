class Review < ApplicationRecord
  belongs_to :cocktail
  belongs_to :user

  has_many :likes, dependent: :destroy

  validates :stars, presence: true, inclusion: 0..5
  validates :description, presence: true

   def blank_stars
     5 - stars.to_i
   end
end
