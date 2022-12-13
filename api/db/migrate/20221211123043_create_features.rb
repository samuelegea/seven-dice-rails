class CreateFeatures < ActiveRecord::Migration[7.0]
  def change
    create_table :features, id: :uuid do |t|
      t.string :name,      null: false, default: ''
      t.text :description, null: false, default: ''
      t.json :details,     null: false

      t.timestamps
    end
  end
end
