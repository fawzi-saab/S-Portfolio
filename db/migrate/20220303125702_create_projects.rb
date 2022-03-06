class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :project_description
      t.string :project_link
      t.references :profile
      t.timestamps
    end
  end
end
