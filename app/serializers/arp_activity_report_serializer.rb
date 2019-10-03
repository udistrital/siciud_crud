class ArpActivityReportSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers

  attributes :id, :arp_activity_id, :status, :completedPercentage,:support_document_url,:comment

  def support_document_url
    rails_blob_path(self.object.supportDocument, only_path: true) if self.object.supportDocument.attached?
  end
end
