class CreateWeights < ActiveRecord::Migration[6.0]
  def change
    create_table :weights do |t|
      t.float      :value,            null: false
      t.integer    :unity,            null: false
      t.date       :registration_date
      t.references :user,             null: false, foreign_key: true

      t.timestamps
    end
  end
end
