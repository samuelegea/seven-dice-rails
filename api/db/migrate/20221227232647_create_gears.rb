class CreateGears < ActiveRecord::Migration[7.0]
  def change
    create_table :gears, id: :uuid do |t|
      t.integer :category, null: false

      t.timestamps
    end
  end
end
