class Call < ApplicationRecord
  belongs_to :call_type
  belongs_to :call_user_role
  belongs_to :duration_type

  has_one_attached :termsOfReference
  has_one_attached :apertureResolution
  has_one_attached :addendum

  has_many :calls_product_types
  has_many :product_types, through: :calls_product_types
  has_many :call_item_categories
  has_many :item_calls, through: :call_item_calls
  has_many :calls_required_documents
  has_many :required_documents, through: :calls_required_documents

  validates :duration, :startDate, presence: true
  validates :duration, :globalBudget, :maxBudgetPerProject, numericality: {:greater_than => 0}
  validates :maxBudgetPerProject, numericality: {:less_than_or_equal_to => :globalBudget}
end
