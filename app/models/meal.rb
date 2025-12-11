class Meal < ApplicationRecord
  has_many :meal_items, dependent: :destroy
  has_many :foods, through: :meal_items
  has_many :measures, through: :meal_items

  accepts_nested_attributes_for :meal_items, allow_destroy: true

  validates :name, presence: true
end

