class Book < ApplicationRecord
  belongs_to :category
  belongs_to :editorial
  belongs_to :research_group
end
