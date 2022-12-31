class CreateTools < ActiveRecord::Migration[7.0]
  def change
    create_table :tools, id: :uuid do |t|
      t.integer :category

      t.timestamps
    end
  end
end
