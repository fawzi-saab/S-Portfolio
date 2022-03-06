class AddBackgroundToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :profession, :string
    add_column :profiles, :background_overview, :text
    add_column :profiles, :years_of_experience, :integer
  end
end
