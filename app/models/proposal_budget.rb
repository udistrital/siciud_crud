class ProposalBudget < ApplicationRecord
  include Swagger::ProposalBudgetSchema

  belongs_to :call_item
  belongs_to :proposal

  validates :amount_request_cidc, :counterparty, :amount_in_kind,
            :subtotal,
            numericality: {
    greater_than_or_equal_to: 0}

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
