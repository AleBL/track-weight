class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.integer    :kind,        null: false
      t.time       :eating_time, null: false
      t.text       :description, null: false
      t.references :diet,        null: false, foreign_key: true

      t.timestamps
    end
  end
end
