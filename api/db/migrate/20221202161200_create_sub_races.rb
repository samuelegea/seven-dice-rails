class CreateSubRaces < ActiveRecord::Migration[7.0]
  def change
    create_table :sub_races, id: :uuid do |t|
      t.string     :name, null: false
      t.references :race, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
