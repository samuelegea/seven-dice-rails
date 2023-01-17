class CreateProficiencyChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :proficiency_choices, id: :uuid do |t|
      t.integer :choose, null: false
      t.references :source, null: false, polymorphic: true, type: :uuid
      t.references :proficiency, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
