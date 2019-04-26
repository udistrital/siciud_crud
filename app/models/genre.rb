class Genre < ApplicationRecord
    has_many :researchers
    validates :name, presence: true

end
