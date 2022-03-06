class Experience < ApplicationRecord
    belongs_to :profile
    validates :company_name, presence: true
    validates :position_title, presence: true
    validates :start_month, presence: true
    validates :start_year, presence: true
    validates :tasks_description, presence: true
end
