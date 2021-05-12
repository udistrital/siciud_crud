module Swagger::DocumentSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :Document do
      property :doc_name do
        key :type, :string
      end
      property :doc_path do
        key :type, :string
      end
      property :doc_size do
        key :type, :integer
        key :format, :int64
      end
      property :nuxeo_id do
        key :type, :string
      end
      property :document_type_id do
        key :type, :integer
        key :format, :int64
      end
    end

    swagger_schema :DocumentInputPost do
      allOf do
        schema do
          property :document do
            key :'$ref', :Document
          end
        end
        schema do
          property :document do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :DocumentInputPut do
      allOf do
        schema do
          property :document do
            key :'$ref', :Document
          end
        end
        schema do
          property :document do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :DocumentOutput do
      allOf do
        schema do
          key :'$ref', :Document
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :documentable_id do
            key :type, :integer
            key :format, :int64
          end
          property :active do
            key :type, :boolean
            key :default, true
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

    swagger_schema :DocumentDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :DocumentOutput
            end
          end
        end
      end
    end

  end
end
