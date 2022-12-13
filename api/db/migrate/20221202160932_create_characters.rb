class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters, id: :uuid do |t|
      t.string     :name,        null: false, default: ''
      t.string     :description, null: false, default: ''
      t.jsonb      :stats,       null: false
      t.jsonb      :personality, null: false
      t.references :race,        null: false, foreign_key: true, type: :uuid
      t.references :subrace,     null: false, type: :uuid

      t.timestamps
    end
  end
end
