class CallsRequiredDocument < ApplicationRecord
  belongs_to :call
  belongs_to :required_document

  validates :required_document_id, uniqueness: {scope: :call_id,
                                   message: 'Record of required documents already exists'}
end
