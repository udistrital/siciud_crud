module Swagger::KeywordSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :Keyword do
      property :name do
        key :type, :string
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :KeywordInputPost do
      allOf do
        schema do
          property :keyword do
            key :'$ref', :Keyword
          end
        end
        schema do
          property :keyword do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :KeywordInputPut do
      allOf do
        schema do
          property :keyword do
            key :'$ref', :Keyword
          end
        end
        schema do
          property :keyword do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :KeywordOutput do
      allOf do
        schema do
          key :'$ref', :Keyword
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

    swagger_schema :KeywordDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :KeywordOutput
            end
          end
        end
      end
    end
  end
end