class CreateEquipaments < ActiveRecord::Migration[7.0]
  def change
    create_table :equipaments, id: :uuid do |t|
      t.string     :name,            null: false, default: ''
      t.string     :desc,            null: false, default: ''
      t.integer    :equipament_type, null: false, default: 0
      t.json       :details,         null: false, default: {}

      t.timestamps
    end
  end
end
