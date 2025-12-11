class MealItem < ApplicationRecord
  belongs_to :meal
  belongs_to :food
  belongs_to :measure

  validates :quantity, presence: true, numericality: { greater_than: 0 }
end

