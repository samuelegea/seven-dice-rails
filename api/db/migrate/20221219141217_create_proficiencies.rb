class CreateProficiencies < ActiveRecord::Migration[7.0]
  def change
    create_table :proficiencies, id: :uuid do |t|
      t.references :source,             null: false, polymorphic: true, type: :uuid
      t.references :equipment_category, type: :uuid
      t.references :weapon_category,    type: :uuid
      t.references :armor_category,     type: :uuid
      t.references :tool_category,      type: :uuid
      t.references :skill,              type: :uuid
      t.references :saving_throw,       type: :uuid
      t.references :ability,            type: :uuid
      t.references :language,           type: :uuid
      t.references :vehicle,            type: :uuid
      t.references :weapon,             type: :uuid
      t.references :armor,              type: :uuid
      t.references :tool,               type: :uuid

      t.timestamps
    end
  end
end
