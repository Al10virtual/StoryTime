class AddStoryCoverFileNameToStories < ActiveRecord::Migration[7.0]
  def change
    add_column :stories, :story_cover_file_name, :string
  end
end
