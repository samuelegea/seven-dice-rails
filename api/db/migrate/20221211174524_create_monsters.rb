class CreateMonsters < ActiveRecord::Migration[7.0]
  def change
    create_table :monsters, id: :uuid do |t|
      t.string :name
      t.text :desc
      t.json :details
      t.float :challenge_rating
      t.integer :creature_type
      t.integer :size
      t.integer :aligment

      t.timestamps
    end
  end
end
