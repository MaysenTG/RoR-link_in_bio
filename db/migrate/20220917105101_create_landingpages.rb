class CreateLandingpages < ActiveRecord::Migration[7.0]
  def change
    create_table :landingpages do |t|
      t.string :url

      t.timestamps
    end
  end
end