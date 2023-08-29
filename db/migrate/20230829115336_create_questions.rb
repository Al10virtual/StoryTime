class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.integer :type
      t.references :answer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
