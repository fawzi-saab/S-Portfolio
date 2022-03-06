class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :contact_email
      t.string :country
      t.string :city
      t.string :phone_number
      t.string :fb_link
      t.string :lkd_link
      t.string :github_link
      t.timestamps
      t.references :user
    end
  end
end
