class AddColumnsToStories < ActiveRecord::Migration[7.0]
  def change
    add_column :stories, :first_name, :string
    add_column :stories, :last_name, :string
  end
end
