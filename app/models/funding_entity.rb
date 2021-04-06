class FundingEntity < ApplicationRecord

    has_and_belongs_to_many :plant_ind_prototypes

    # validates :name, presence: true
    # validates :country, presence: true
    # validates :city, presence: true
    # #validates :phoneNumber, presence: true
    # #validates :mobileNumber, presence: true
    # validates :address, presence: true

    has_many :contributions
    has_many :fe_contacts
    belongs_to :entity_type, optional: true
end
