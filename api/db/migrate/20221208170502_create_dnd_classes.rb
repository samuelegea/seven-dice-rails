class CreateDndClasses < ActiveRecord::Migration[7.0]
  def change
    create_table :dnd_classes, id: :uuid do |t|
      t.string  :name,          null: false, default: ''
      t.text    :desc,          null: false, default: ''
      t.integer :hit_die,       null: false, default: 0
      t.json    :details,       null: false
      t.integer :saving_throws, null: false, default: [], array: true

      t.timestamps
    end
  end
end
