class RemoveImageFromStories < ActiveRecord::Migration[7.0]
  def change
    remove_column :stories, :image, :string
  end
end
