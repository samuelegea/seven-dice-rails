class CreateProficiencies < ActiveRecord::Migration[7.0]
  def change
    create_table :proficiencies, id: :uuid do |t|
      t.references :source,          null: false, polymorphic: true, type: :uuid
      t.integer    :equipament_type, null: false

      t.timestamps
    end
  end
end
