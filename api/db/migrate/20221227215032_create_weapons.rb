class CreateWeapons < ActiveRecord::Migration[7.0]
  def change
    create_table :weapons, id: :uuid do |t|
      t.boolean :melee,       null: false
      t.boolean :martial,     null: false
      t.integer :damage_type, null: false
      t.string  :damage_dice, null: false
      t.integer :range,       null: false
      t.integer :range_long
      t.integer :throw_range
      t.integer :throw_range_long
      t.string  :two_handed_damage_dice
      t.integer :two_handed_damage_type
      t.json    :actions

      t.timestamps
    end
  end
end
