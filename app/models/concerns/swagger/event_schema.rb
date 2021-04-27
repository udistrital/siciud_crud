module Swagger::EventSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :Event do
      property :category_id do
        key :type, :integer
        key :format, :int64
      end
      property :colciencias_call_id do
        key :type, :integer
        key :format, :int64
      end
      property :eve_name do
        key :type, :string
      end
      property :eve_start_date do
        key :type, :string
        key :format, :date
      end
      property :eve_finish_date do
        key :type, :string
        key :format, :date
      end
      property :eve_organizers do
        key :type, :string
      end
      property :eve_entities do
        key :type, :string
      end
      property :eve_type_id do
        key :type, :integer
        key :format, :int64
      end
      property :geo_city_id do
        key :type, :integer
        key :format, :int64
      end
      property :eve_observation do
        key :type, :string
      end
      property :participation_id do
        key :type, :integer
        key :format, :int64
      end
    end

    swagger_schema :EventInputPut do
      allOf do
        schema do
          property :event do
            key :'$ref', :Event
          end
        end
        schema do
          property :event do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :EventInputPost do
      allOf do
        schema do
          property :event do
            key :'$ref', :Event
          end
        end
        schema do
          property :event do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :EventOutput do
      allOf do
        schema do
          key :'$ref', :Event
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
          property :participation_name do
            key :type, :string
          end
          property :research_group_id do
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
    swagger_schema :EventDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :EventOutput
            end
          end
        end
      end
    end
  end
end