module Swagger::ProcedureRequestSchema
    extend ActiveSupport::Concern
    include Swagger::Blocks
  
    included do
      swagger_schema :ProcedureRequest do
        key :required, [:id]
        property :approached_problem do
          key :type, :string
        end
      end
  
      swagger_schema :ProcedureRequestInputPost do
        allOf do
          schema do
            property :procedure_request do
              key :'$ref', :ProcedureRequest
            end
          end
          schema do
            property :procedure_request do
              property :created_by do
                key :type, :integer
                key :format, :int64
              end
            end
          end
        end
      end
  
      swagger_schema :ProcedureRequestInputPut do
        allOf do
          schema do
            property :procedure_request do
              key :'$ref', :ProcedureRequest
            end
          end
          schema do
            property :procedure_request do
              property :updated_by do
                key :type, :integer
                key :format, :int64
              end
            end
          end
        end
      end
  
      swagger_schema :ProcedureRequestOutput do
        allOf do
          schema do
            key :'$ref', :ProcedureRequest
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