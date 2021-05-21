module Swagger::NewScientificRecordSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :NewScientificRecord do
      property :nsr_name do
        key :type, :string
      end
      property :nsr_date_of_obtaining do
        key :type, :string
        key :format, :date
      end
      property :nsr_database_name do
        key :type, :string
      end
      property :nsr_database_url do
        key :type, :string
      end
      property :nsr_certifying_institution do
        key :type, :string
      end
      property :nsr_issuing_institution do
        key :type, :string
      end
      property :category_id do
        key :type, :integer
        key :format, :int64
      end
      property :research_group_id do
        key :type, :integer
        key :format, :int64
      end
      property :colciencias_call_id do
        key :type, :integer
        key :format, :int64
      end
      property :observation do
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
    end

    swagger_schema :NewScientificRecordInputPost do
      allOf do
        schema do
          property :new_scientific_record do
            key :'$ref', :NewScientificRecord
          end
        end
        schema do
          property :new_scientific_record do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :NewScientificRecordInputPut do
      allOf do
        schema do
          property :new_scientific_record do
            key :'$ref', :NewScientificRecord
          end
        end
        schema do
          property :new_scientific_record do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :NewScientificRecordOutput do
      allOf do
        schema do
          key :'$ref', :NewScientificRecord
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

    swagger_schema :NewScientificRecordDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :NewScientificRecordOutput
            end
          end
        end
      end
    end
  end
end