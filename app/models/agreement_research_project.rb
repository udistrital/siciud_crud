class AgreementResearchProject < ApplicationRecord
  belongs_to :agreement
  has_many :contribution_rp_items
end
