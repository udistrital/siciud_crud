class HistLegalRepresentative < ApplicationRecord
  include Swagger::HistLegalRepresentativeSchema

  belongs_to :legal_representative
  belongs_to :entity
end
