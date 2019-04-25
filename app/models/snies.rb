class Snies < ApplicationRecord
    has_many :researchers

    validates :name, presence: true
end
