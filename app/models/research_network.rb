class ResearchNetwork < ApplicationRecord
  belongs_to :researcher
  belongs_to :cine_broad_area, optional: true
  belongs_to :cine_specific_area, optional: true
  belongs_to :oecd_knowledge_subarea, optional: true
  belongs_to :oecd_knowledge_area, optional: true

  belongs_to :main_research_group, class_name: 'ResearchGroup',
             foreign_key: 'main_research_group_id'
  belongs_to :network_type, class_name: 'Subtype',
             foreign_key: 'network_type_id'

  has_many :affiliated_entities

  has_many :documents, as: :documentable

  has_and_belongs_to_many :faculties,
                          join_table: 'faculties_research_networks',
                          class_name: 'Subtype'
  has_and_belongs_to_many :research_focuses,
                          join_table: 'research_focuses_networks',
                          class_name: 'Subtype'

  has_and_belongs_to_many :oecd_disciplines
  has_and_belongs_to_many :cine_detailed_areas
  has_and_belongs_to_many :snies

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
