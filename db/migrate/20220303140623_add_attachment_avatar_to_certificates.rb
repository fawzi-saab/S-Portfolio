class AddAttachmentAvatarToCertificates < ActiveRecord::Migration[5.0]
  def self.up
    
      add_attachment :certificates, :avatar
    
  end

  def self.down
    remove_attachment :certificates, :avatar
  end
end
