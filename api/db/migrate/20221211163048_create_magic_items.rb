class CreateMagicItems < ActiveRecord::Migration[7.0]
  def change
    create_table :magic_items, id: :uuid do |t|
      t.string  :name,        null: false, default: ''
      t.text    :desc, 	      null: false, default: ''
      t.boolean :comsumable,  null: false, default: false
      t.json    :rarity,      null: false
      t.json    :type,        null: false
      t.json    :subtype,     null: false
      t.json    :requires_attunement, null: false
      t.json    :details,     null: false

      t.timestamps
    end
  end
end
