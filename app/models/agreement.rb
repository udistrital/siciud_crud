class Agreement < ApplicationRecord
  include Swagger::AgreementSchema
  
  has_one_attached :contractDocument
  has_one_attached :initialActDocument #Acta de inicio
  #belongs_to :faculty
  belongs_to :agreement_status
  belongs_to :agreement_type
  has_and_belongs_to_many :research_groups, presence: true, optional: false
  has_many :faculties, through: :research_groups
  has_many :contributions
  has_many :funding_entities, through: :contributions
  has_many :agreement_research_projects
  validates :agreementNumber, uniqueness: true
  #validates :research_groups, presence: true
end
