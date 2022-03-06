class CreateExperiences < ActiveRecord::Migration[5.0]
  def change
    create_table :experiences do |t|
      t.string :company_name
      t.string :position_title
      t.integer :start_month
      t.integer :start_year
      t.integer :end_month
      t.integer :end_year
      t.text :tasks_description
      t.references :profile
      t.timestamps
    end
  end
end
