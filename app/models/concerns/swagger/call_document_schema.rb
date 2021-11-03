module Swagger::CallDocumentSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :CallDocument do
      property :document_id do
        key :type, :integer
        key :format, :int64
      end
      property :cd_required do
        key :type, :boolean
        key :default, true
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :CallDocumentInputPost do
      allOf do
        schema do
          property :call_document do
            key :'$ref', :CallDocument
          end
        end
        schema do
          property :call_document do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :CallDocumentInputPut do
      allOf do
        schema do
          property :call_document do
            key :'$ref', :CallDocument
          end
        end
        schema do
          property :call_document do
            property :call_id do
              key :type, :integer
              key :format, :int64
            end
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :CallDocumentOutput do
      allOf do
        schema do
          key :'$ref', :CallDocument
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :call_id do
            key :type, :integer
            key :format, :int64
          end
          property :document_name do
            key :type, :string
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

    swagger_schema :CallDocumentDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :CallDocumentOutput
            end
          end
        end
      end
    end
  end
end