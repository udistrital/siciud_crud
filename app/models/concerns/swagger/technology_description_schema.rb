module Swagger::TechnologyDescriptionSchema
    extend ActiveSupport::Concern
    include Swagger::Blocks
  
    included do
        swagger_schema :TechnologyDescription do
            property :denomination do
                key :type, :string
            end
            property :product_or_process_features do
                key :type, :string
            end
            property :artistic_representation do
                key :type, :string
            end
            property :key_words do
                key :type, :string
            end
        end
  
        swagger_schema :TechnologyDescriptionInputPost do
            allOf do
                schema do
                    property :technology_description do
                        key :'$ref', :TechnologyDescription
                    end
                end
                schema do
                    property :technology_description do
                        property :created_by do
                            key :type, :integer
                            key :format, :int64
                        end
                    end
                end
            end
        end
  
        swagger_schema :TechnologyDescriptionInputPut do
            allOf do
                schema do
                    property :technology_description do
                        key :'$ref', :TechnologyDescription
                    end
                end
                schema do
                    property :technology_description do
                        property :updated_by do
                            key :type, :integer
                            key :format, :int64
                        end
                    end
                end
            end
        end
  
        swagger_schema :TechnologyDescriptionOutput do
            allOf do
                schema do
                    key :'$ref', :TechnologyDescription
                end
                schema do
                    property :id do
                        key :type, :integer
                        key :format, :int64
                    end
                    property :created_by do
                        key :type, :integer
                        key :format, :int64
                    end
                    property :updated_by do
                        key :type, :integer
                        key :format, :int64
                    end
                    property :procedure_request_id do
                        key :type, :integer
                        key :format, :int64
                    end
                    property :active do
                        key :type, :boolean
                        key :default, true
                      end
                    property :created_at do
                        key :type, :string
                        key :format, 'date-time'
                    end
                    property :updated_at do
                        key :type, :string
                        key :format, 'date-time'
                    end
                end
            end
        end
  
    end
end