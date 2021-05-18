module Swagger::TechnicalConceptSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :TechnicalConcept do
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
      property :consecutive_number do
        key :type, :integer
        key :format, :int64
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
      property :request_date do
        key :type, :string
        key :format, :date
      end
      property :requesting_institution_name do
        key :type, :string
      end
      property :research_group_id do
        key :type, :integer
        key :format, :int64
      end
      property :send_date do
        key :type, :string
        key :format, :date
      end
      property :observation do
        key :type, :string
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :TechnicalConceptInputPost do
      allOf do
        schema do
          property :technical_concept do
            key :'$ref', :TechnicalConcept
          end
        end
        schema do
          property :technical_concept do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :TechnicalConceptInputPut do
      allOf do
        schema do
          property :technical_concept do
            key :'$ref', :TechnicalConcept
          end
        end
        schema do
          property :technical_concept do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :TechnicalConceptOutput do
      allOf do
        schema do
          key :'$ref', :TechnicalConcept
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

    swagger_schema :TechnicalConceptDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :TechnicalConceptOutput
            end
          end
        end
      end
    end
  end
end