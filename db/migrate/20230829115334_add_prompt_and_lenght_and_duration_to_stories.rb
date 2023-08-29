class AddPromptAndLenghtAndDurationToStories < ActiveRecord::Migration[7.0]
  def change
    add_column :stories, :prompt, :text
    add_column :stories, :lenght, :integer
    add_column :stories, :duration, :integer
  end
end
