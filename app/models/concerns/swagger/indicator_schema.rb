module Swagger::IndicatorSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :Indicator do
      property :ind_description do
        key :type, :string
      end
      property :subtype_id do
        key :type, :integer
        key :format, :int64
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :IndicatorInputPost do
      allOf do
        schema do
          property :indicator do
            key :'$ref', :Indicator
          end
        end
        schema do
          property :indicator do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :IndicatorInputPut do
      allOf do
        schema do
          property :indicator do
            key :'$ref', :Indicator
          end
        end
        schema do
          property :indicator do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :IndicatorOutput do
      allOf do
        schema do
          key :'$ref', :Indicator
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :subtype_name do
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

    swagger_schema :IndicatorDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :IndicatorOutput
            end
          end
        end
      end
    end
  end
end