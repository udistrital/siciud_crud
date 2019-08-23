class FundingEntity < ApplicationRecord
    validates :name, presence: true
    validates :country, presence: true
    validates :city, presence: true
    #validates :phoneNumber, presence: true
    #validates :mobileNumber, presence: true
    validates :address, presence: true

    has_many :contributions
    belongs_to :entity_type
end
