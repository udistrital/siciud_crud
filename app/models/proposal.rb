class Proposal < ApplicationRecord
  include Swagger::ProposalSchema

  belongs_to :proposal_status, class_name: 'Subtype', foreign_key: 'proposal_status_id'
  belongs_to :project_type, class_name: 'Subtype', foreign_key: 'project_type_id'

  belongs_to :call

  has_and_belongs_to_many :entities
  has_and_belongs_to_many :dependencies
  # has_and_belongs_to_many :research_groups

  has_many :external_members_proposals
  has_many :internal_members_proposals
  has_many :research_groups_proposals

  has_many :chapters, as: :sectionable

  validates :duration, :total_amount_in_kind, :total_amount_request_cidc,
            :total_counterparty, numericality: { greater_than_or_equal_to: 0 }

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
