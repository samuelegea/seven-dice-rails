class StandardizeDescriptionWithTextForAllNecessaryTables < ActiveRecord::Migration[7.0]
  def change
    rename_column :equipaments, :desc, :description
    change_column :equipaments, :description, :text

    rename_column :feats, :desc, :description
    rename_column :monsters, :desc, :description
    rename_column :spells, :desc, :description
    rename_column :dnd_classes, :desc, :description
    rename_column :dnd_sub_classes, :desc, :description
  end
end
