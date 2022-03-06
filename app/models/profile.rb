class Profile < ApplicationRecord
    
    belongs_to :user
    has_many :educations
    has_many :experiences
    has_many :projects
    has_many :certificates
    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "https://restorixhealth.com/wp-content/uploads/2018/08/No-Image-684x1024.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
