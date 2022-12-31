class CreateArmors < ActiveRecord::Migration[7.0]
  def change
    create_table :armors, id: :uuid do |t|
      t.integer :category, null: false
      t.integer :armor_class, null: false
      t.boolean :armor_class_dex_bonus, null: false, default: false
      t.integer :armor_class_max_bonus, null: true
      t.boolean :stealth_disadvantage, null: false
      t.integer :str_minimum, null: false

      t.timestamps
    end
  end
end
