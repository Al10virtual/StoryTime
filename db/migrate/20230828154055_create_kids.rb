class CreateKids < ActiveRecord::Migration[7.0]
  def change
    create_table :kids do |t|
      t.string :first_name
      t.date :date_of_birth
      t.references :family, null: false, foreign_key: true

      t.timestamps
    end
  end
end
