module Swagger::ContactSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :Contact do
      property :name do
        key :type, :string
      end
      property :email do
        key :type, :string
      end
      property :identification_number do
        key :type, :string
      end
      property :identification_type_id do
        key :type, :integer
        key :format, :int64
      end
      property :phone do
        key :type, :string
      end
      property :mobile do
        key :type, :string
      end
      property :address do
        key :type, :string
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :ContactInputPost do
      allOf do
        schema do
          property :contact do
            key :'$ref', :Contact
          end
        end
        schema do
          property :contact do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ContactInputPut do
      allOf do
        schema do
          property :contact do
            key :'$ref', :Contact
          end
        end
        schema do
          property :contact do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ContactOutput do
      allOf do
        schema do
          key :'$ref', :Contact
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :identification_type_name do
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

    swagger_schema :ContactDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :ContactOutput
            end
          end
        end
      end
    end
  end
end