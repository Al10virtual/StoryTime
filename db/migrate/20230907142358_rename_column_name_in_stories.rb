class RenameColumnNameInStories < ActiveRecord::Migration[7.0]
  def change
    rename_column :stories, :length, :length
  end
end
