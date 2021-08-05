module Swagger::ProcedureSchema
    extend ActiveSupport::Concern
    include Swagger::Blocks
  
  included do
    swagger_schema :Procedure do
      key :required, [:id]
      property :name do
        key :type, :string
      end
    end

    swagger_schema :ProcedureInputPost do
      allOf do
        schema do
          property :procedure do
            key :'$ref', :Procedure
          end
        end
        schema do
          property :procedure do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ProcedureInputPut do
      allOf do
        schema do
          property :procedure do
            key :'$ref', :Procedure
          end
        end
        schema do
          property :procedure do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ProcedureOutput do
      allOf do
        schema do
          key :'$ref', :Procedure
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