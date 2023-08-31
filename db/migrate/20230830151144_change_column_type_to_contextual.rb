class ChangeColumnTypeToContextual < ActiveRecord::Migration[7.0]
  def change
    remove_column :questions, :type
    add_column :questions, :contextual, :boolean
  end
end
