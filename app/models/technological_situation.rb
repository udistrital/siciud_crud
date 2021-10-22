class TechnologicalSituation < ApplicationRecord
  include Swagger::TechnologicalSituationSchema
  belongs_to :procedure_request
  has_and_belongs_to_many :development_stages,
                          join_table: 'technological_situations_development_stages',
                          class_name: 'Subtype'
  has_and_belongs_to_many :technology_reasons,
                          join_table: 'technological_situations_technology_reasons',
                          class_name: 'Subtype'
end
