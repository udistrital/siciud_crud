class ResearchGroup < ApplicationRecord
  #Relaciones con los documentos y con los diferentes modelos
  has_one_attached :facultyActDocument
  has_one_attached :cidcActDocument
  has_and_belongs_to_many :faculties
  has_and_belongs_to_many :curricular_projects
  has_and_belongs_to_many :research_focuses
  has_and_belongs_to_many :agreements
  has_and_belongs_to_many :oecd_disciplines
  belongs_to :state_group
  belongs_to :snies
  #  belongs_to :research_focus
  has_many :group_members
  has_many :historical_colciencias_ranks
  has_many :plan_periods, as: :planable

  #Validaciones de los campos obligatorios
  validates :name, :acronym, :cidcRegistrationDate,
            :cidcActNumber, :facultyActNumber, :facultyRegistrationDate, :state_group_id,
            :snies_id,
            :email,:curricular_projects, presence: true
end
