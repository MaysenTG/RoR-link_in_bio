class AddAccountIdToLandingpages < ActiveRecord::Migration[7.0]
  def change
    add_column :landingpages, :account_id, :integer
  end
end
