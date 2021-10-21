class ResearchGroup < ApplicationRecord
  include Swagger::ResearchUnitSchema

  belongs_to :group_state, class_name: 'Subtype', foreign_key: 'group_state_id', optional: true
  belongs_to :group_type, class_name: 'Subtype', foreign_key: 'group_type_id', optional: true
  belongs_to :cine_broad_area, optional: true
  belongs_to :cine_specific_area, optional: true
  belongs_to :oecd_knowledge_area, optional: true
  belongs_to :oecd_knowledge_subarea, optional: true
  belongs_to :snies, optional: true

  belongs_to :parent, class_name: 'ResearchGroup', optional: true

  has_and_belongs_to_many :research_focuses,
                          join_table: 'research_focuses_units',
                          class_name: 'Subtype'
  has_and_belongs_to_many :oecd_disciplines
  has_and_belongs_to_many :cine_detailed_areas

  has_many :research_groups, class_name: 'ResearchGroup', foreign_key: 'parent_id'

  has_many :faculty_ids_research_groups
  has_many :curricular_prj_ids_research_groups
  has_many :group_members
  has_many :historical_colciencias_ranks

  # Products
  has_many :books
  has_many :book_chapters
  has_many :ip_livestock_breeds
  has_many :new_animal_breeds
  has_many :papers
  has_many :patents
  has_many :research_creation_works
  has_many :scientific_notes
  has_many :vegetable_varieties

  has_many :industrial_designs
  has_many :integrated_circuit_diagrams
  has_many :software
  has_many :plant_ind_prototypes
  has_many :new_scientific_records
  has_many :technical_concepts
  has_many :distinctive_signs
  has_many :nutraceutical_products
  has_many :scientific_collections
  has_many :enterprise_secrets
  has_many :enterprises
  has_many :innovations
  has_many :regulations
  has_many :clinical_practice_guidelines
  has_many :guide_manuals
  has_many :protocol_acts
  has_many :bills
  has_many :license_agreements

  has_many :events
  has_many :appropriation_processes
  has_many :knowledge_networks
  has_many :creation_workshops
  has_many :working_papers
  has_many :new_genetic_sequences
  has_many :reports
  has_many :consultancies
  has_many :magazine_editions
  has_many :publications
  has_many :simple_books
  has_many :content_generations
  has_many :informative_bulletins
  has_many :investigation_projects
  has_many :idi_investigation_projects
  has_many :extension_projects
  has_many :training_courses
  has_many :accompaniment_consultancies

  has_many :degree_works

  has_many :research_groups_research_networks
  has_many :research_networks, through: :research_groups_research_networks

  has_many :action_plans

  has_many :documents, as: :documentable

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  # Too validate_created_by, validate_updated_by methods
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
