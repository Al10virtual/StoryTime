class RenameStoryCoverFileNameInStories < ActiveRecord::Migration[7.0]
  def change
    rename_column :stories, :story_cover_file_name, :cover_file_name
  end
end
