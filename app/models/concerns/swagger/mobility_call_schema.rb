module Swagger::MobilityCallSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :MobilityCall do
      property :geo_city_id do
        key :type, :integer
        key :format, :int64
      end
      property :geo_country_id do
        key :type, :integer
        key :format, :int64
      end
      property :geo_state_id do
        key :type, :integer
        key :format, :int64
      end
      property :event_name do
        key :type, :string
      end
      property :event_edition_number do
        key :type, :integer
        key :format, :int64
      end
      property :event_date do
        key :type, :string
        key :format, :date
      end
      property :paper_name do
        key :type, :string
      end
      property :is_organizer do
        key :type, :boolean
        key :default, true
      end
      property :event_page do
        key :type, :string
      end
      property :research_group_id do
        key :type, :integer
        key :format, :int64
      end
      property :researcher_id do
        key :type, :integer
        key :format, :int64
      end
      property :state_id do
        key :type, :integer
        key :format, :int64
      end
      property :total do
        key :type, :number
        key :format, :float
        key :minimum, 0
        key :exclusiveMinimum, false
        key :maximum, 100
        key :exclusiveMaximum, false
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :MobilityCallInputPost do
      allOf do
        schema do
          property :mobility_call do
            key :'$ref', :MobilityCall
          end
        end
        schema do
          property :mobility_call do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :MobilityCallInputPut do
      allOf do
        schema do
          property :mobility_call do
            key :'$ref', :MobilityCall
          end
        end
        schema do
          property :mobility_call do
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

    swagger_schema :MobilityCallOutput do
      allOf do
        schema do
          key :'$ref', :MobilityCall
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
          property :geo_city_name do
            key :type, :string
          end
          property :geo_country_name do
            key :type, :string
          end
          property :geo_state_name do
            key :type, :string
          end
          property :item_name do
            key :type, :string
          end
          property :state_name do
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

    swagger_schema :MobilityCallDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :MobilityCallOutput
            end
          end
        end
      end
    end

    swagger_schema :ChangeMobilityCall do
      property :state_id do
        key :type, :integer
        key :format, :int64
      end
      property :total do
        key :type, :number
        key :format, :float
        key :minimum, 0
        key :exclusiveMinimum, false
        key :maximum, 100
        key :exclusiveMaximum, false
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
      property :updated_by do
        key :type, :integer
        key :format, :int64
      end
    end
  end
end