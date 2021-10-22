class TechnologyDescriptionSerializer < ActiveModel::Serializer
  attributes  :id, :denomination, :product_or_process_features, :artistic_representation, 
              :key_words, :created_by, :updated_by, :active, :created_at, :updated_at, :procedure_request_id

end
