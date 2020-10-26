class Patent < ApplicationRecord
  belongs_to :category
  belongs_to :patent_state
  belongs_to :research_group
end
