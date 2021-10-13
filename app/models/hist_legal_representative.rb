class HistLegalRepresentative < ApplicationRecord
  belongs_to :legal_representative
  belongs_to :entity
end
