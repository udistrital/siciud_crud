class ArpActivityReport < ApplicationRecord
  belongs_to :arp_activity
  has_one_attached :supportDocument
  validate :support_document_present?
  attribute :approved, :boolean, default: false
  private

  def support_document_present?
    errors.add(:supportDocument, :content_type) unless supportDocument.attached? && supportDocument.content_type == "application/pdf"
  end
end

