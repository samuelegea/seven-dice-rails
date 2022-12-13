class CreateFeatsCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :feats_characters, id: :uuid do |t|
      t.references :feats, null: false, foreign_key: true, type: :uuid
      t.references :users, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
