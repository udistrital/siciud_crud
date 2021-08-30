class Subtype < ApplicationRecord
  include Swagger::SubtypeSchema

  belongs_to :type

  belongs_to :parent, class_name: 'Subtype', optional: true

  has_many :subtypes, class_name: 'Subtype', foreign_key: 'parent_id', dependent: :destroy
  has_and_belongs_to_many :research_creation_works,
                          join_table: 'research_creation_works_work_types',
                          class_name: 'ResearchCreationWork',
                          inverse_of: :work_types

  has_and_belongs_to_many :research_units,
                          join_table: 'research_focuses_units',
                          class_name: 'ResearchGroup',
                          inverse_of: :research_units
  has_and_belongs_to_many :form_d_act_plans,
                          join_table: 'research_focuses_form_d_plans',
                          class_name: 'FormDActPlan',
                          inverse_of: :form_d_act_plans

  has_many :document_types, class_name: 'Document', foreign_key: 'document_type_id', dependent: :destroy

  has_many :research_groups, class_name: 'ResearchGroup', foreign_key: 'group_state_id', dependent: :destroy
  has_many :research_groups, class_name: 'ResearchGroup', foreign_key: 'group_type_id', dependent: :destroy

  has_many :books, class_name: 'Book', foreign_key: 'category_id', dependent: :destroy
  has_many :book_chapters, class_name: 'BookChapter', foreign_key: 'category_id', dependent: :destroy
  has_many :ip_livestock_breeds, class_name: 'IpLivestockBreed', foreign_key: 'category_id', dependent: :destroy
  has_many :new_animal_breeds, class_name: 'NewAnimalBreed', foreign_key: 'category_id', dependent: :destroy
  has_many :new_animal_breeds, class_name: 'NewAnimalBreed', foreign_key: 'cycle_type_id', dependent: :destroy
  has_many :new_animal_breeds, class_name: 'NewAnimalBreed', foreign_key: 'petition_status_id', dependent: :destroy
  has_many :papers, class_name: 'Paper', foreign_key: 'category_id', dependent: :destroy
  has_many :papers, class_name: 'Paper', foreign_key: 'paper_type_id', dependent: :destroy
  has_many :patents, class_name: 'Patent', foreign_key: 'category_id', dependent: :destroy
  has_many :patents, class_name: 'Patent', foreign_key: 'patent_state_id', dependent: :destroy
  has_many :research_creation_works, class_name: 'ResearchCreationWork', foreign_key: 'category_id', dependent: :destroy
  has_many :research_creation_works, class_name: 'ResearchCreationWork', foreign_key: 'knwl_spec_area_id', dependent: :destroy
  has_many :scientific_notes, class_name: 'ScientificNote', foreign_key: 'category_id', dependent: :destroy
  has_many :vegetable_varieties, class_name: 'VegetableVariety', foreign_key: 'category_id', dependent: :destroy
  has_many :vegetable_varieties, class_name: 'VegetableVariety', foreign_key: 'cycle_type_id', dependent: :destroy
  has_many :vegetable_varieties, class_name: 'VegetableVariety', foreign_key: 'petition_status_id', dependent: :destroy

  has_many :ext_participants, class_name: 'ExtParticipant', foreign_key: 'participant_type_id', dependent: :destroy
  has_many :int_participants, class_name: 'IntParticipant', foreign_key: 'participant_type_id', dependent: :destroy

  has_many :calls, class_name: 'Call', foreign_key: 'call_beneficiary_id', dependent: :destroy
  has_many :calls, class_name: 'Call', foreign_key: 'call_state_id', dependent: :destroy
  has_many :calls, class_name: 'Call', foreign_key: 'call_type_id', dependent: :destroy
  has_many :call_items
  has_many :calls, through: :call_items, source: :call
  has_many :indicators, class_name: 'Indicator', foreign_key: 'product_type_id', dependent: :destroy

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :st_name, presence: true, allow_blank: false, on: :create
  validates :st_name, exclusion: { in: [nil], message: "can't be nil" }
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
