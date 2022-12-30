class CreateArmors < ActiveRecord::Migration[7.0]
  def change
    create_table :armors, id: :uuid do |t|
      t.text :name
      t.text :description
      t.integer :category
      t.integer :armor_class
      t.boolean :armor_class_dex_bonus
      t.integer :armor_class_max_bonus
      t.boolean :stealth_disadvantage
      t.integer :str_minimun

      t.timestamps
    end
  end
end
