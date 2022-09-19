class AddSocialsToDeviseAccount < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :facebook, :string
    add_column :accounts, :twitter, :string
    add_column :accounts, :linkedin, :string
    add_column :accounts, :github, :string
  end
end
