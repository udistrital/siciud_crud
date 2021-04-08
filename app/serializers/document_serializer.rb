class DocumentSerializer < ActiveModel::Serializer
  attributes :id, :doc_name, :doc_path, :nuxeo_id,
             :doc_size, :active
  has_one :documentable
  has_one :document_type
  has_one :created_by
  has_one :updated_by
end
