class CreateEquipamentContents < ActiveRecord::Migration[7.0]
  def change
    create_table :equipament_contents, id: :uuid do |t|
      t.integer :quantity, null: false, default: 1
      t.references :holder, null: false, foreign_key: { to_table: :equipaments }, type: :uuid
      t.references :holdee, null: false, foreign_key: { to_table: :equipaments }, type: :uuid

      t.timestamps
    end
  end
end
