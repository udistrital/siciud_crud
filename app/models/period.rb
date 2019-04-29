class Period < ApplicationRecord
  belongs_to :role
  belongs_to :researcher
  belongs_to :research_group
end
