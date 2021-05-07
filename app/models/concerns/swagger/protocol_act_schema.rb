module Swagger::ProtocolActSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :ProtocolAct do
      property :title do
        key :type, :string
      end
      property :category_id do
        key :type, :integer
        key :format, :int64
      end
      property :colciencias_call_id do
        key :type, :integer
        key :format, :int64
      end
      property :date_of_publication do
        key :type, :string
        key :format, :date
      end
      property :geo_city_id do
        key :type, :integer
        key :format, :int64
      end
      property :research_group_id do
        key :type, :integer
        key :format, :int64
      end
      property :product_type_id do
        key :type, :integer
        key :format, :int64
      end
      property :observation do
        key :type, :string
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :ProtocolActInputPost do
      allOf do
        schema do
          property :protocol_act do
            key :'$ref', :ProtocolAct
          end
        end
        schema do
          property :protocol_act do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ProtocolActInputPut do
      allOf do
        schema do
          property :protocol_act do
            key :'$ref', :ProtocolAct
          end
        end
        schema do
          property :protocol_act do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ProtocolActOutput do
      allOf do
        schema do
          key :'$ref', :ProtocolAct
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :category_name do
            key :type, :string
          end
          property :colciencias_call_name do
            key :type, :string
          end
          property :colciencias_call_year do
            key :type, :integer
            key :format, :int64
          end
          property :geo_city_name do
            key :type, :string
          end
          property :geo_country_id do
            key :type, :integer
            key :format, :int64
          end
          property :geo_country_name do
            key :type, :string
          end
          property :geo_state_id do
            key :type, :integer
            key :format, :int64
          end
          property :geo_state_name do
            key :type, :string
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

    swagger_schema :ProtocolActDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :ProtocolActOutput
            end
          end
        end
      end
    end
  end
end