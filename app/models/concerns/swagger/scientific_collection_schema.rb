module Swagger::ScientificCollectionSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :ScientificCollection do
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
      property :curator_name do
        key :type, :string
      end
      property :date_of_obtaining do
        key :type, :string
        key :format, :date
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
      property :information_included do
        key :type, :string
      end
      property :last_conservatorship_date do
        key :type, :string
        key :format, :date
      end
      property :managing_institution_name do
        key :type, :string
      end
      property :research_group_id do
        key :type, :integer
        key :format, :int64
      end
      property :validity_and_use do
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

    swagger_schema :ScientificCollectionInputPost do
      allOf do
        schema do
          property :scientific_collection do
            key :'$ref', :ScientificCollection
          end
        end
        schema do
          property :scientific_collection do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ScientificCollectionInputPut do
      allOf do
        schema do
          property :scientific_collection do
            key :'$ref', :ScientificCollection
          end
        end
        schema do
          property :scientific_collection do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ScientificCollectionOutput do
      allOf do
        schema do
          key :'$ref', :ScientificCollection
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

    swagger_schema :ScientificCollectionDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :ScientificCollectionOutput
            end
          end
        end
      end
    end
  end
end