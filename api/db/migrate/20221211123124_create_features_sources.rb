class CreateFeaturesSources < ActiveRecord::Migration[7.0]
  def change
    create_table :features_sources, id: :uuid do |t|
      t.references :source, polymorphic: { default: 'Race' }, null: false, type: :uuid
      t.references :feature, null: false, foreign_key: true, type: :uuid
      t.timestamps
    end
  end
end
