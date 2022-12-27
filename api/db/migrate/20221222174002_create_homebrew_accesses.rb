class CreateHomebrewAccesses < ActiveRecord::Migration[7.0]
  def change
    create_table :homebrew_accesses, id: :uuid do |t|
      t.references :character, null: false, foreign_key: true, type: :uuid
      t.references :source, null: false, polymorphic: true, type: :uuid

      t.timestamps
    end
  end
end
