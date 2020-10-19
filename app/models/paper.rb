class Paper < ApplicationRecord
  belongs_to :category
  belongs_to :journal
  belongs_to :paper_type
  belongs_to :research_group
end
