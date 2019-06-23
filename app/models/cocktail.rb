class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :favorites
  has_many :users

  belongs_to :user

  validates :name, presence: true, uniqueness: true

  mount_uploader :photo, PhotoUploader

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
