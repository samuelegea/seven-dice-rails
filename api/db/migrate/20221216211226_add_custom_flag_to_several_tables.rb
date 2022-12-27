class AddCustomFlagToSeveralTables < ActiveRecord::Migration[7.0]
  def change
    add_column :races, :homebrew, :boolean, null: false, default: false
    add_column :sub_races, :homebrew, :boolean, null: false, default: false
    add_column :dnd_classes, :homebrew, :boolean, null: false, default: false
    add_column :dnd_sub_classes, :homebrew, :boolean, null: false, default: false
    add_column :proficiencies, :homebrew, :boolean, null: false, default: false
    add_column :skills, :homebrew, :boolean, null: false, default: false
    add_column :spells, :homebrew, :boolean, null: false, default: false
    add_column :features, :homebrew, :boolean, null: false, default: false
    add_column :feats, :homebrew, :boolean, null: false, default: false
    add_column :monsters, :homebrew, :boolean, null: false, default: false
    add_column :traits, :homebrew, :boolean, null: false, default: false

    add_column :races, :public, :boolean, null: false, default: true
    add_column :sub_races, :public, :boolean, null: false, default: true
    add_column :dnd_classes, :public, :boolean, null: false, default: true
    add_column :dnd_sub_classes, :public, :boolean, null: false, default: true
    add_column :proficiencies, :public, :boolean, null: false, default: true
    add_column :skills, :public, :boolean, null: false, default: true
    add_column :spells, :public, :boolean, null: false, default: true
    add_column :features, :public, :boolean, null: false, default: true
    add_column :feats, :public, :boolean, null: false, default: true
    add_column :monsters, :public, :boolean, null: false, default: true
    add_column :traits, :public, :boolean, null: false, default: true
  end
end
