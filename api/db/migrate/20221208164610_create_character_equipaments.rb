class CreateCharacterEquipaments < ActiveRecord::Migration[7.0]
  def change
    create_table :character_equipaments, id: :uuid do |t|
      t.references :character,  null: false, foreign_key: true, type: :uuid
      t.references :equipament, null: false, foreign_key: true, type: :uuid
      t.integer    :status,     null: false
      t.json       :details,    null: false

      t.timestamps
    end
  end
end
