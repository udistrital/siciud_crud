class ResearchGroup < ApplicationRecord
  belongs_to :group_state
  belongs_to :group_type
  belongs_to :cine_broad_area, optional: true
  belongs_to :cine_specific_area, optional: true
  belongs_to :oecd_knowledge_area, optional: true
  belongs_to :oecd_knowledge_subarea, optional: true

  has_and_belongs_to_many :research_focuses
  has_and_belongs_to_many :agreements
  has_and_belongs_to_many :oecd_disciplines
  has_and_belongs_to_many :cine_detailed_areas

  has_many :faculty_ids_research_groups
  has_many :curricular_prj_ids_research_groups
  has_many :group_members
  has_many :historical_colciencias_ranks
  has_many :plan_periods, as: :planable

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

  #Validaciones de los campos obligatorios
  validates :name, :acronym, :cidc_registration_date,
            :cidc_act_number, :faculty_act_number, :faculty_registration_date,
            :group_state_id, presence: true

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false
  validates :updated_by, presence: true, allow_nil: false, on: :update

  validate :validate_created_by, :validate_updated_by

  def validate_created_by
    user_id = self.created_by
    if user_id and not user_id.blank?
      begin
        User.find(user_id)
      rescue ActiveRecord::RecordNotFound => e
        errors.add(:created_by, "Usuario no encontrado con 'created_by': #{user_id}")
      end
    end
  end

  def validate_updated_by
    user_id = self.updated_by
    if user_id and not user_id.blank?
      begin
        User.find(user_id)
      rescue ActiveRecord::RecordNotFound => e
        errors.add(:updated_by, "Usuario no encontrado con 'updated_by': #{user_id}")
      end
    end
  end
end
