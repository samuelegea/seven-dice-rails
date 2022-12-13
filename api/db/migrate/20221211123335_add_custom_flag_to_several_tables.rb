class AddCustomFlagToSeveralTables < ActiveRecord::Migration[7.0]
  def change
    add_column :races, :homebrew, :boolean, null: false, default: true
    add_column :sub_racse, :homebrew, :boolean, null: false, default: true
    add_column :dnd_classes, :homebrew, :boolean, null: false, default: true
    add_column :dnd_sub_classes, :homebrew, :boolean, null: false, default: true
    add_column :proficiencies, :homebrew, :boolean, null: false, default: true
    add_column :skills, :homebrew, :boolean, null: false, default: true
    add_column :spells, :homebrew, :boolean, null: false, default: true
    add_column :features, :homebrew, :boolean, null: false, default: true
    add_column :feats, :homebrew, :boolean, null: false, default: true
    add_column :equipament, :homebrew, :boolean, null: false, default: true
    add_column :magic_items, :homebrew, :boolean, null: false, default: true
    # add_column :monsters, :homebrew, :boolean, null: false, default: true
    # add_column :traits, :homebrew, :boolean, null: false, default: true
  end
end
