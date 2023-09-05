class AddAudioFileNameToStorie < ActiveRecord::Migration[7.0]
  def change
    add_column :stories, :audio_file_name, :string
  end
end
