module Swagger::SubtypeSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :Subtype do
      property :st_name do
        key :type, :string
      end
      property :st_description do
        key :type, :string
      end
      property :parent_id do
        key :type, :integer
        key :format, :int64
      end
    end

    swagger_schema :SubtypeInputPost do
      allOf do
        schema do
          property :subtype do
            key :'$ref', :Subtype
          end
        end
        schema do
          property :subtype do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :SubtypeInputPut do
      allOf do
        schema do
          property :subtype do
            key :'$ref', :Subtype
          end
        end
        schema do
          property :subtype do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :SubtypeOutput do
      allOf do
        schema do
          key :'$ref', :Subtype
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :parent_name do
            key :type, :string
          end
          property :type_id do
            key :type, :integer
            key :format, :int64
          end
          property :type_name do
            key :type, :string
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

  end
end
