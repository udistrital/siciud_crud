class RequiredDocument < ApplicationRecord
  has_many :calls_required_documents
  has_many :calls, through: :calls_required_documents
end
