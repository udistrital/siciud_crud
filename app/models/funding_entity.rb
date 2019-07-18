class FundingEntity < ApplicationRecord
    has_many :contributions
    belongs_to :entity_type
end
