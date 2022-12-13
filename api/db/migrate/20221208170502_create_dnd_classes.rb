class CreateDndClasses < ActiveRecord::Migration[7.0]
  def change
    create_table :dnd_classes, id: :uuid do |t|
      t.string :name,     null: false, default: ''
      t.text   :desc,     null: false, default: ''
      t.json   :details,  null: false

      t.timestamps
    end
  end
end
