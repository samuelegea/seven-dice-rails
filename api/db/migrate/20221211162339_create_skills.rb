class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills, id: :uuid do |t|
      t.string :name,                   null: false, default: ''
      t.text :description,              null: false, default: ''
      t.integer :default_ability_score, null: false, default: 0

      t.timestamps
    end
  end
end
