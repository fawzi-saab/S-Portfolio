class Certificate < ActiveRecord::Base
    belongs_to :profile
    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "https://www.freeiconspng.com/uploads/no-image-icon-11.PNG"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  
end
