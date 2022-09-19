class AddSortColToBlocks < ActiveRecord::Migration[7.0]
  def change
    add_column :blocks, :position, :integer #for RailsSortable
  end
end
