class ArpPaymentSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :inCashValue, :inKindValue, :date, :cdpCode, :rpCode, :bizagiCode, :arp_expense_id, :paymentDocument, :rpDocument, :cdpDocument

  def paymentDocument
    rails_blob_path(self.object.paymentDocument, only_path: true) if self.object.paymentDocument.attached?
  end

  def rpDocument
    rails_blob_path(self.object.rpDocument, only_path: true) if self.object.rpDocument.attached?
  end

  def cdpDocument
    rails_blob_path(self.object.cdpDocument, only_path: true) if self.object.cdpDocument.attached?
  end
end
