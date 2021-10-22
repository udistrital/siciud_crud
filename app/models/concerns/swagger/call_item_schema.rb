module Swagger::CallItemSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :CallItem do
      property :ci_maximum_percentage do
        key :type, :number
        key :format, :float
        key :minimum, 0
        key :exclusiveMinimum, false
        key :maximum, 100
        key :exclusiveMaximum, false
      end
      property :ci_percentage do
        key :type, :number
        key :format, :float
        key :minimum, 0
        key :exclusiveMinimum, false
        key :maximum, 100
        key :exclusiveMaximum, false
      end
      property :item_id do
        key :type, :integer
        key :format, :int64
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :CallItemInputPost do
      allOf do
        schema do
          property :call_item do
            key :'$ref', :CallItem
          end
        end
        schema do
          property :call_item do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :CallItemInputPut do
      allOf do
        schema do
          property :call_item do
            key :'$ref', :CallItem
          end
        end
        schema do
          property :call_item do
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

    swagger_schema :CallItemOutput do
      allOf do
        schema do
          key :'$ref', :CallItem
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
          property :item_name do
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

    swagger_schema :CallItemDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :CallItemOutput
            end
          end
        end
      end
    end
  end
end