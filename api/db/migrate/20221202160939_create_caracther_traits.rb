class CreateCaractherTraits < ActiveRecord::Migration[7.0]
  def change
    create_table :character_traits, id: :uuid do |t|
      t.references :traits, type: :uuid
      t.references :characters, type: :uuid

      t.timestamps
    end
  end
end
