class CreateCertificates < ActiveRecord::Migration[5.0]
  def change
    create_table :certificates do |t|
      t.string :title
      t.string :institute
      t.references :profile
      t.timestamps
    end
  end
end
