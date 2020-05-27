class CallsRequiredDocument < ApplicationRecord
  belongs_to :call
  belongs_to :required_document
end
