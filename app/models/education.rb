class Education < ActiveRecord::Base
    belongs_to :profile
    validates :title, presence: true
    validates :institute, presence: true
    validates :year_of_graduation, presence: true
end
