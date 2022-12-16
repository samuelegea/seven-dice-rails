class SpokenLanguage < ActiveRecord::Migration[7.0]
  def change
    create_table :spoken_languages, id: :uuid do |t|
      t.references :language, type: :uuid, null: false
      t.references :speaker, polymorphic: true

      t.timestamps
    end
  end
end
