class RenameColumnNameInStories < ActiveRecord::Migration[7.0]
  def change
    rename_column :stories, :lenght, :length
  end
end
