class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles, id: :uuid do |t|
      t.integer :speed_qtd
      t.integer :speed_unit
      t.integer :capacity
      t.integer :vehicle_category, null: false

      t.timestamps
    end
  end
end
