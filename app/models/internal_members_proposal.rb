class InternalMembersProposal < ApplicationRecord
  include Swagger::InternalMembersProposalSchema

  belongs_to :proposal
  belongs_to :researcher
  belongs_to :role

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
