class CreateStartingEquipmentChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :starting_equipment_choices, id: :uuid do |t|
      t.integer :choose
      t.references :source, null: false, polymorphic: true, type: :uuid
      t.references :equipments, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
