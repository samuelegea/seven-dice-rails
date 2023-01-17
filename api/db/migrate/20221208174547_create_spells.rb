class CreateSpells < ActiveRecord::Migration[7.0]
  def change
    create_table :spells, id: :uuid do |t|
      t.string  :name,                null: false
      t.text    :desc,                null: false
      t.string  :components,          null: false, default: ''
      t.integer :level,               null: false, default: 0
      t.string  :material,            null: false, default: ''
      t.boolean :ritual,              null: false, default: false
      t.boolean :concentration,       null: false, default: false
      t.integer :duration_qtd,        null: false
      t.integer :duration_type,       null: false, default: 0
      t.integer :casting_time_qtd,    null: false, default: 1
      t.integer :casting_time_type,   null: false, default: 0
      t.float   :range,               null: false, default: 0
      t.integer :range_type,          null: false, default: 0
      t.integer :area_of_effect_type, null: true, default: 0
      t.integer :area_of_effect_size, null: true, default: 1
      t.integer :school,              null: false, default: 0
      t.json    :details,             null: false

      t.timestamps
    end
  end
end
