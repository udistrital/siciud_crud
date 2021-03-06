module Swagger::NewGeneticSequenceSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :NewGeneticSequence do
      property :name do
        key :type, :string
      end
      property :category_id do
        key :type, :integer
        key :format, :int64
      end
      property :certifying_institution do
        key :type, :string
      end
      property :colciencias_call_id do
        key :type, :integer
        key :format, :int64
      end
      property :database_name do
        key :type, :string
      end
      property :database_url do
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
      property :research_group_id do
        key :type, :integer
        key :format, :int64
      end
      property :observation do
        key :type, :string
      end
      property :obtaining_date do
        key :type, :string
        key :format, :date
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :NewGeneticSequenceInputPost do
      allOf do
        schema do
          property :new_genetic_sequence do
            key :'$ref', :NewGeneticSequence
          end
        end
        schema do
          property :new_genetic_sequence do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :NewGeneticSequenceInputPut do
      allOf do
        schema do
          property :new_genetic_sequence do
            key :'$ref', :NewGeneticSequence
          end
        end
        schema do
          property :new_genetic_sequence do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :NewGeneticSequenceOutput do
      allOf do
        schema do
          key :'$ref', :NewGeneticSequence
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

    swagger_schema :NewGeneticSequenceDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :NewGeneticSequenceOutput
            end
          end
        end
      end
    end
  end
end