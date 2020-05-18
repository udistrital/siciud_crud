class ArpActivityReport < ApplicationRecord
  enum status: {approved: 0, inReview: 1, rejected: 2}
  belongs_to :arp_activity
  has_one_attached :supportDocument
  validates :supportDocument, content_type: ["application/pdf"]
  #validate :support_document_present?
  attribute :status, :integer, default: :inReview
  attribute :comment, :text, default: ""
    # private
    #
    # def support_document_present?
    #   errors.add(:supportDocument, :content_type) unless supportDocument.attached? && supportDocument.content_type == "application/pdf"
    # end
end

