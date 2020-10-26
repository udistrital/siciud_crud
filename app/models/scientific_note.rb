class ScientificNote < ApplicationRecord
  belongs_to :category
  belongs_to :journal
  belongs_to :research_group
end
