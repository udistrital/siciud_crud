module Swagger::RequestHasApplicationAreaSchema
    extend ActiveSupport::Concern
    include Swagger::Blocks
  
    included do
      swagger_schema :RequestHasApplicationArea do
        key :required, [:id]
      end
  
      swagger_schema :RequestHasApplicationAreaInputPost do
        allOf do
          schema do
            property :request_has_application_area do
              key :'$ref', :RequestHasApplicationArea
            end
          end
          schema do
            property :request_has_application_area do
              property :created_by do
                key :type, :integer
                key :format, :int64
              end
              property :application_area_id do
                key :type, :integer
                key :format, :int64
               end
            end
          end
        end
      end
  
      swagger_schema :RequestHasApplicationAreaOutput do
        allOf do
          schema do
            key :'$ref', :RequestHasApplicationArea
          end
          schema do
            property :id do
              key :type, :integer
              key :format, :int64
            end
            property :application_area_id do
                key :type, :integer
                key :format, :int64
            end
            property :procedure_request_id do
                key :type, :integer
                key :format, :int64
            end
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
            property :active do
              key :type, :boolean
              key :default, true
            end
            property :updated_by do
              key :type, :integer
              key :format, :int64
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