class AddAvatarFileNameToKids < ActiveRecord::Migration[7.0]
  def change
    add_column :kids, :avatar_file_name, :string
  end
end
