class CreateDndSubClasses < ActiveRecord::Migration[7.0]
  def change
    create_table :dnd_sub_classes, id: :uuid do |t|
      t.string     :name,      null: false, default: ''
      t.text       :desc,      null: false, default: ''
      t.json       :details,   null: false
      t.references :dnd_class, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
