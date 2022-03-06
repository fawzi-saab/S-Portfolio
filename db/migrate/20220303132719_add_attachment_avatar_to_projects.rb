class AddAttachmentAvatarToProjects < ActiveRecord::Migration[5.0]
  def self.up
    
      add_attachment :projects, :avatar
    
  end

  def self.down
    remove_attachment :projects, :avatar
  end
end
