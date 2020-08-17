class CreateDiets < ActiveRecord::Migration[6.0]
  def change
    create_table :diets do |t|
      t.date       :initial_date, null: false
      t.date       :end_date    , null: false
      t.references :user        , null: false, foreign_key: true

      t.timestamps
    end
  end
end
