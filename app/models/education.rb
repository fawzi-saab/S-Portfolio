class Education < ApplicationRecord
    belongs_to :profile
    validates :title, presence: true
    validates :institute, presence: true
    validates :year_of_graduation, presence: true
end
