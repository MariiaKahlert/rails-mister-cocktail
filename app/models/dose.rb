class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true
  validates :cocktail, presence: true, uniqueness: { scope: :ingredient_id }
  validates :ingredient, presence: true, uniqueness: { scope: :cocktail_id }
end
