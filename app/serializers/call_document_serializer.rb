class CallDocumentSerializer < ActiveModel::Serializer
  attributes :id, :call_id, :document_id, :document_name,
             :cd_required, :active, :created_by, :updated_by, :created_at, :updated_at

  def document_name
    document = self.object.document
    if document
      document.st_name
    end
  end
end
