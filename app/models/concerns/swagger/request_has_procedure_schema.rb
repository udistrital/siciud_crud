module Swagger::RequestHasProcedureSchema
    extend ActiveSupport::Concern
    include Swagger::Blocks
  
    included do
      swagger_schema :RequestHasProcedure do
        key :required, [:id]
      end
  
      swagger_schema :RequestHasProcedureInputPost do
        allOf do
          schema do
            property :request_has_procedure do
              key :'$ref', :RequestHasProcedure
            end
          end
          schema do
            property :request_has_procedure do
              property :created_by do
                key :type, :integer
                key :format, :int64
              end
              property :procedure_id do
                key :type, :integer
                key :format, :int64
               end
              property :procedure_request_id do
                key :type, :integer
                key :format, :int64
              end
            end
          end
        end
      end
  
      swagger_schema :RequestHasProcedureInputPut do
        allOf do
          schema do
            property :request_has_procedure do
              key :'$ref', :RequestHasProcedure
            end
          end
          schema do
            property :request_has_procedure do
              property :updated_by do
                key :type, :integer
                key :format, :int64
              end
            end
          end
        end
      end
  
      swagger_schema :RequestHasProcedureOutput do
        allOf do
          schema do
            key :'$ref', :RequestHasProcedure
          end
          schema do
            property :id do
              key :type, :integer
              key :format, :int64
            end
            property :procedure_id do
                key :type, :integer
                key :format, :int64
            end
            property :procedure_name do
                key :type, :string
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