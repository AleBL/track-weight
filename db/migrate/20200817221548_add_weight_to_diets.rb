class AddWeightToDiets < ActiveRecord::Migration[6.0]
  def change
    add_reference :diets, :initial_weight, foreign_key: { to_table: :weights }, null: false
    add_reference :diets, :ideal_weight,   foreign_key: { to_table: :weights }, null: false
  end
end
