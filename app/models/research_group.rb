class ResearchGroup < ApplicationRecord
  include Swagger::ResearchUnitSchema

  belongs_to :group_state, class_name: 'Subtype', foreign_key: 'group_state_id', optional: true
  belongs_to :group_type, class_name: 'Subtype', foreign_key: 'group_type_id', optional: true
  belongs_to :cine_broad_area, optional: true
  belongs_to :cine_specific_area, optional: true
  belongs_to :oecd_knowledge_area, optional: true
  belongs_to :oecd_knowledge_subarea, optional: true

  has_and_belongs_to_many :research_focuses, dependent: :destroy
  has_and_belongs_to_many :agreements, dependent: :destroy
  has_and_belongs_to_many :oecd_disciplines, dependent: :destroy
  has_and_belongs_to_many :cine_detailed_areas, dependent: :destroy

  has_many :faculty_ids_research_groups, dependent: :destroy
  has_many :curricular_prj_ids_research_groups, dependent: :destroy
  has_many :group_members, dependent: :destroy
  has_many :historical_colciencias_ranks, dependent: :destroy
  has_many :plan_periods, as: :planable, dependent: :destroy

  # Products
  has_many :books, dependent: :destroy
  has_many :book_chapters, dependent: :destroy
  has_many :ip_livestock_breeds, dependent: :destroy
  has_many :new_animal_breeds, dependent: :destroy
  has_many :papers, dependent: :destroy
  has_many :patents, dependent: :destroy
  has_many :research_creation_works, dependent: :destroy
  has_many :scientific_notes, dependent: :destroy
  has_many :vegetable_varieties, dependent: :destroy

  has_many :industrial_designs, dependent: :destroy
  has_many :integrated_circuit_diagrams, dependent: :destroy
  has_many :software, dependent: :destroy


  has_many :documents, as: :documentable

  #Validaciones de los campos obligatorios
  validates :name, :acronym, :cidc_registration_date,
            :cidc_act_number, :faculty_act_number, :faculty_registration_date,
            :group_state_id, presence: true

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  # Too validate_created_by, validate_updated_by methods
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
