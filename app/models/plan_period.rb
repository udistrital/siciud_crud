class PlanPeriod < ApplicationRecord
  belongs_to :planable, polymorphic: true
end
