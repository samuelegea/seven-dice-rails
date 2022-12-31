class CreateEquipments < ActiveRecord::Migration[7.0]
  def change
    create_table :equipments, id: :uuid do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.references :source, null: false, polymorphic: true, type: :uuid
      t.float :cost_qtd, scale: 2
      t.integer :cost_unit
      t.references :equipment_category, null: false, foreign_key: true, type: :uuid
      t.integer :weight
      t.integer :default_quantity, default: 1

      t.timestamps
    end
  end
end
