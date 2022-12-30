class WeaponPropertiesWeapons < ActiveRecord::Migration[7.0]
  def change
    create_table :weapon_properties_weapons, id: :uuid do |t|
      t.references :weapon, type: :uuid, foreign_key: true
      t.references :weapon_property, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
