class CreateEquipments < ActiveRecord::Migration[7.0]
  def change
    create_table :equipments, id: :uuid do |t|
      t.references :source, null: false, polymorphic: true, type: :uuid
      t.float :cost_qtd, scale: 2
      t.integer :cost_unit
      t.references :equipment_category, null: false, foreign_key: true, type: :uuid
      t.integer :weight

      t.timestamps
    end
  end
end
