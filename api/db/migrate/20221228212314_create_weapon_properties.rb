class CreateWeaponProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :weapon_properties, id: :uuid do |t|
      t.string :name
      t.text :description
      t.json :actions

      t.timestamps
    end
  end
end
