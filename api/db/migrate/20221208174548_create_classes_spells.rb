class CreateClassesSpells < ActiveRecord::Migration[7.0]
  def change
    create_table :classes_spells, id: :uuid do |t|
      t.references :dnd_class, null: false, foreign_key: true, type: :uuid
      t.references :spell,     null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
