class CreateGearsEquipments < ActiveRecord::Migration[7.0]
  def change
    create_table :gears_equipments, id: :uuid do |t|
      t.references :gear, null: false, foreign_key: true, type: :uuid
      t.references :equipments, null: false, foreign_key: true, type: :uuid
      t.integer :quantity

      t.timestamps
    end
  end
end
