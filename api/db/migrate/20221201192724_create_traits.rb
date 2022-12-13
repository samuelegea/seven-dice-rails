class CreateTraits < ActiveRecord::Migration[7.0]
  def change
    create_table :traits, id: :uuid do |t|
      t.string     :name,        null: false
      t.text       :description, null: false
      t.references :source,      polymorphic: { default: 'Race' }
      t.jsonb      :details,     null: false

      t.timestamps
    end
  end
end
