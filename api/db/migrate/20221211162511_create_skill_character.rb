class CreateSkillCharacter < ActiveRecord::Migration[7.0]
  def change
    create_table :skill_characters, id: :uuid do |t|
      t.references :skills,    null: false, foreign_key: true, type: :uuid
      t.references :character, null: false, foreign_key: true, type: :uuid
      t.integer    :proficiency_level, null: false, default: 0
      t.timestamps
    end
  end
end
