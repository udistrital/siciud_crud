class Call < ApplicationRecord
  belongs_to :call_type
  belongs_to :call_user_role

  validates :duration, :startDate, presence: true
  validates :duration, :globalBudget, :maxBudgetPerProject, numericality: {:greater_than => 0}
  validates :maxBudgetPerProject, numericality: {:less_than_or_equal_to => :globalBudget}
end
