class Review < ApplicationRecord
  belongs_to :cocktail
  belongs_to :user
  validates :stars, presence: true, inclusion: 0..5
  validates :description, presence: true
end
