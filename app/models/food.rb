class Food < ApplicationRecord
  has_many :measures, dependent: :destroy

  accepts_nested_attributes_for :measures, allow_destroy: true

  validates :name, presence: true

  def get_measure_by_unit(unit)
    measures.find_by(unit: unit)
  end

  def to_s
    name
  end
end

