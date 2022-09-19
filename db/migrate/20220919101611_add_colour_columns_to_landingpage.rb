class AddColourColumnsToLandingpage < ActiveRecord::Migration[7.0]
  def change
    add_column :landingpages, :main_bg_colour, :string, default: "#ffffff"
    add_column :landingpages, :profile_bg_colour, :string, default: "#ffffff"
  end
end
