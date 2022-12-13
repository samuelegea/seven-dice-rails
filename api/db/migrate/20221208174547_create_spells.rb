class CreateSpells < ActiveRecord::Migration[7.0]
  def change
    create_table :spells, id: :uuid do |t|
      t.string  :name,              null: false
      t.text    :desc,              null: false
      t.integer :components,        null: false, default: [], array: true
      t.json    :details,           null: false
      t.integer :duration_qtd,      null: false
      t.integer :duration_type,     null: false
      t.boolean :concentration,     null: false, default: false
      t.boolean :ritual,            null: false, default: false
      t.integer :casting_time_qtd,  null: false, default: 1
      t.integer :casting_time_type, null: false, default: 0
      t.float   :range,             null: false, default: 0
      t.integer :cast_type,         null: false, default: 0
      t.json    :format,            null: false
      t.boolean :summoning,         null: false, default: false
      t.integer :school,            null: false, default: 0

      t.timestamps
    end
  end
end
