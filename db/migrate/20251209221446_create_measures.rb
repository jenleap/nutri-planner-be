class CreateMeasures < ActiveRecord::Migration[7.1]
  def change
    create_table :measures do |t|
      t.references :food, null: false, foreign_key: true
      t.decimal :quantity, precision: 6, scale: 2
      t.string :unit
      t.string :custom_unit
      t.decimal :calories, precision: 6, scale: 2
      t.decimal :carbs, precision: 6, scale: 2
      t.decimal :protein, precision: 6, scale: 2
      t.decimal :fat, precision: 6, scale: 2
      t.decimal :fiber, precision: 6, scale: 2

      t.timestamps
    end
  end
end
