class AddColumnsToBlock < ActiveRecord::Migration[7.0]
  def change
    add_column :blocks, :title, :string
    add_column :blocks, :content, :string
  end
end
