module Swagger::CreationWorkshopSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :CreationWorkshop do
      property :name do
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
      property :funding_institution do
        key :type, :string
      end
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
      property :organization_name do
        key :type, :string
      end
      property :research_group_id do
        key :type, :integer
        key :format, :int64
      end
      property :start_date do
        key :type, :string
        key :format, :date
      end
      property :finish_date do
        key :type, :string
        key :format, :date
      end
      property :observation do
        key :type, :string
      end
      property :participation_id do
        key :type, :integer
        key :format, :int64
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :CreationWorkshopInputPost do
      allOf do
        schema do
          property :creation_workshop do
            key :'$ref', :CreationWorkshop
          end
        end
        schema do
          property :creation_workshop do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :CreationWorkshopInputPut do
      allOf do
        schema do
          property :creation_workshop do
            key :'$ref', :CreationWorkshop
          end
        end
        schema do
          property :creation_workshop do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :CreationWorkshopOutput do
      allOf do
        schema do
          key :'$ref', :CreationWorkshop
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
          property :geo_country_name do
            key :type, :string
          end
          property :geo_state_name do
            key :type, :string
          end
          property :participation_name do
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

    swagger_schema :CreationWorkshopDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :CreationWorkshopOutput
            end
          end
        end
      end
    end
  end
end