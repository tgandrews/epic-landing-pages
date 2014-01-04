class CreateLandingPages < ActiveRecord::Migration
  def change
    create_table :landing_pages do |t|
      t.string :url
      t.integer :owner_id

      t.timestamps
    end
  end
end
