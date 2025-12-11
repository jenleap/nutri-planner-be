class Measure < ApplicationRecord
  belongs_to :food

  UNITS_OF_MEASURE = {
    "0" => "custom",
    "1" => "g",
    "2" => "oz",
    "3" => "lb(s)",
    "4" => "cup(s)",
    "5" => "tbsp",
    "6" => "tsp",
    "7" => "serving(s)"
  }.freeze

  validates :quantity, presence: true
  validates :unit, presence: true
  validates :calories, presence: true

  def unit_label
    return custom_unit if unit == "0"
    UNITS_OF_MEASURE[unit] || "Unknown unit"
  end
end

