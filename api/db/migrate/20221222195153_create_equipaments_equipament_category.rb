class CreateEquipamentsEquipamentCategory < ActiveRecord::Migration[7.0]
  def change
    create_table :equipaments_equipament_categories, id: :uuid do |t|
      t.references :equipament, null: false, foreign_key: true, type: :uuid, index: { name: "equipment_on_equipament_id" }
      t.references :equipament_category, null: false, foreign_key: true, type: :uuid, index: { name: "equipment_category_on_equipament_category_id" }

      t.timestamps
    end
  end
end
