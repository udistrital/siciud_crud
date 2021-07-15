module Swagger::CallsIndicatorSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :CallsIndicator do
      property :indicator_id do
        key :type, :integer
        key :format, :int64
      end
      property :clind_quantity do
        key :type, :integer
        key :format, :int64
      end
      property :clind_required do
        key :type, :boolean
        key :default, true
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :CallsIndicatorInputPost do
      allOf do
        schema do
          property :calls_indicator do
            key :'$ref', :CallsIndicator
          end
        end
        schema do
          property :calls_indicator do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :CallsIndicatorInputPut do
      allOf do
        schema do
          property :calls_indicator do
            key :'$ref', :CallsIndicator
          end
        end
        schema do
          property :calls_indicator do
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

    swagger_schema :CallsIndicatorOutput do
      allOf do
        schema do
          key :'$ref', :CallsIndicator
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :indicator_name do
            key :type, :string
          end
          property :product_type_id do
            key :type, :integer
            key :format, :int64
          end
          property :product_type_name do
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

    swagger_schema :CallsIndicatorDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :CallsIndicatorOutput
            end
          end
        end
      end
    end
  end
end