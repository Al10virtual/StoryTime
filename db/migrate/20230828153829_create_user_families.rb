class CreateUserFamilies < ActiveRecord::Migration[7.0]
  def change
    create_table :user_families do |t|
      t.string :role
      t.references :user, null: false, foreign_key: true
      t.references :family, null: false, foreign_key: true

      t.timestamps
    end
  end
end
