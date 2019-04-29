class Snies < ApplicationRecord
    has_many :researchers
    has_many :research_groups
    validates :name, presence: true
end
