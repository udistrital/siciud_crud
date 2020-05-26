class Call < ApplicationRecord
  belongs_to :call_type
  belongs_to :call_user_role
  has_and_belongs_to_many :thematic_axes
  has_and_belongs_to_many :productions

  validates :duration, :startDate, presence: true
  validates :duration, :globalBudget, :maxBudgetPerProject, numericality: {:greater_than => 0}
  validates :maxBudgetPerProject, numericality: {:less_than_or_equal_to => :globalBudget}
end
