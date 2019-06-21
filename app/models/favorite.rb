class Favorite < ApplicationRecord
  belongs_to :cocktail
  belongs_to :user
  validates_uniqueness_of :cocktail_id, scope: :user_id
end
