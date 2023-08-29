class CreateStories < ActiveRecord::Migration[7.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.string :theme
      t.string :content
      t.references :kid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
