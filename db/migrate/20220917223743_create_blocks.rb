class CreateBlocks < ActiveRecord::Migration[7.0]
  def change
    create_table :blocks do |t|
      t.string :block_type
      t.string :url
      t.integer :landingpage_id

      t.timestamps
    end
  end
end
