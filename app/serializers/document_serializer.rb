class DocumentSerializer < ActiveModel::Serializer
  attributes :id, :doc_name, :doc_path, :nuxeo_id,
             :documentable_id, :document_type_id,
             :doc_size, :active, :created_by, :updated_by, :created_at, :updated_at
end
