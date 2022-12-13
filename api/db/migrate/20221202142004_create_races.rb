class CreateRaces < ActiveRecord::Migration[7.0]
  def change
    create_table :races, id: :uuid do |t|
      t.string :name,            nulL: false
      t.string :description,     nulL: false
      t.jsonb :details,          nulL: false
      t.boolean :has_sub_races?, nulL: false

      t.timestamps
    end
  end
end
