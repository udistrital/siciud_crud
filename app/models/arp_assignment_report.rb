class ArpAssignmentReport < ApplicationRecord
  enum status: {approved: 0, inReview: 1, rejected: 2}
  has_one_attached :supportDocument
  validates :supportDocument, content_type: ["application/pdf"]
  belongs_to :arp_assignment
  attribute :status, :integer, default: :inReview
  attribute :comment, :text, default: ""
end
