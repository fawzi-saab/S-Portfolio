class CreateEducations < ActiveRecord::Migration[5.0]
  def change
    create_table :educations do |t|
      t.string :title
      t.string :institute
      t.integer :year_of_graduation
      t.references :profile
      t.timestamps
    end
  end
end
