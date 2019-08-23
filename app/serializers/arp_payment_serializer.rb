class ArpPaymentSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id,:inCashValue,:inKindValue,:date,:code,:bizagiCode,:arp_expense_id,:paymentDocument

  def paymentDocument
    rails_blob_path(self.object.paymentDocument, only_path: true) if self.object.paymentDocument.attached?
  end
end
