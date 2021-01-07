module Swagger::CategorySchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :Category do
      key :required, [:id]
      property :id do
        key :type, :integer
        key :format, :int64
      end
      property :name do
        key :type, :string
      end
      property :product_type_id do
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
        key :format, :'date-time'
      end
      property :updated_at do
        key :type, :string
        key :format, :'date-time'
      end
    end

    swagger_schema :CategoryInput do
      property :category do
        key :required, [:name, :product_type_id]
        property :name do
          key :type, :string
        end
        property :product_type_id do
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
      end
    end

    swagger_schema :CategoryOutput do
      allOf do
        schema do
          key :'$ref', :Category
        end
        schema do
          property :product_type_name do
            key :type, :string
          end
          property :product_typology_id do
            key :type, :integer
            key :format, :int64
          end
          property :product_typology_name do
            key :type, :string
          end
        end
      end
    end
  end
end
