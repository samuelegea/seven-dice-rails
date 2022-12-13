class CreateCampaigns < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigns, id: :uuid do |t|
      t.string :name,           null: false
      t.text :description,      null: false
      t.jsonb :settings,        null: false
      t.references :created_by, null: false, foreign_key: { to_table: :users }, type: :uuid
      t.references :dmed_by,    null: false, foreign_key: { to_table: :users }, type: :uuid

      t.timestamps
    end
  end
end
