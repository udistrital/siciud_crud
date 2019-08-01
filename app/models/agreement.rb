class Agreement < ApplicationRecord
  include Swagger::AgreementSchema

  #belongs_to :faculty
  belongs_to :agreement_status
  belongs_to :agreement_type
  has_and_belongs_to_many :research_groups, presence: true, optional: false
  has_many :faculties, through: :research_groups
  has_many :contributions
  has_many :funding_entities, through: :contributions
  has_many :agreement_research_projects
  validates :research_groups, presence: true
  validates :agreementNumber, uniqueness: true


end
