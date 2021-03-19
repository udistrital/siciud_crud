class Subtype < ApplicationRecord
  belongs_to :type

  belongs_to :parent, class_name: 'Subtype', optional: true

  has_many :subtypes, class_name: 'Subtype', foreign_key: 'parent_id'
  has_and_belongs_to_many :research_creation_works,
                          join_table: 'research_creation_works_work_types',
                          class_name: 'ResearchCreationWork',
                          inverse_of: :work_types


  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :st_name, presence: true, allow_blank: false, on: :create
  validates :st_name, exclusion: { in: [nil], message: "can't be nil" }
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
