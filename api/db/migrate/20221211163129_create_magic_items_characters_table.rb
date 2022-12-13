class CreateMagicItemsCharactersTable < ActiveRecord::Migration[7.0]
  def change
    create_table :magic_items_characters_tables, id: :uuid do |t|
      t.references :magic_item, null: false, foreign_key: true, type: :uuid
      t.references :character,  null: false, foreign_key: true, type: :uuid
      t.integer    :status,     null: false
      t.boolean    :equiped,    null: false, default: false
      t.boolean    :wielded,    null: false, default: false
      t.boolean    :attuned,    null: false, default: false
      

      t.timestamps
    end
  end
end
