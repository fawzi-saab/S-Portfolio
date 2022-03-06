class AddAttachmentAvatarToCertificates < ActiveRecord::Migration[5.0]
  def self.up
    change_table :certificates do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :certificates, :avatar
  end
end
