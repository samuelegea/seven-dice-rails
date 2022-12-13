class CreateEquipaments < ActiveRecord::Migration[7.0]
  def change
    create_table :equipaments, id: :uuid do |t|
      t.string     :name,     null: false
      t.string     :desc,     null: false
      t.references :contents, foreign_key: { to_table: :equipaments }, type: :uuid
      t.json       :details,  null: false

      t.timestamps
    end
  end
end
