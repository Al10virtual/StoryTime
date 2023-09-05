class ChangeColumnTypeInStories < ActiveRecord::Migration[7.0]
  def change
    change_column :stories, :content, :text
  end
end
