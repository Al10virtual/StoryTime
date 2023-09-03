class AddImagePromptToStories < ActiveRecord::Migration[7.0]
  def change
    add_column :stories, :image_prompt, :string
  end
end
