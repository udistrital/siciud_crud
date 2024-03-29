module Swagger::ContentGenerationSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :ContentGeneration do
      property :bibliographic_reference do
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
      property :doi do
        key :type, :string
      end
      property :final_page do
        key :type, :integer
        key :format, :int64
      end
      property :generation_date do
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
      property :isbn do
        key :type, :string
      end
      property :magazine_name do
        key :type, :string
      end
      property :observation do
        key :type, :string
      end
      property :pages_number do
        key :type, :integer
        key :format, :int64
      end
      property :product_type_id do
        key :type, :integer
        key :format, :int64
      end
      property :research_group_id do
        key :type, :integer
        key :format, :int64
      end
      property :start_page do
        key :type, :integer
        key :format, :int64
      end
      property :title do
        key :type, :string
      end
      property :volume do
        key :type, :integer
        key :format, :int64
      end
      property :web_page do
        key :type, :string
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :ContentGenerationInputPost do
      allOf do
        schema do
          property :content_generation do
            key :'$ref', :ContentGeneration
          end
        end
        schema do
          property :content_generation do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ContentGenerationInputPut do
      allOf do
        schema do
          property :content_generation do
            key :'$ref', :ContentGeneration
          end
        end
        schema do
          property :content_generation do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :ContentGenerationOutput do
      allOf do
        schema do
          key :'$ref', :ContentGeneration
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

    swagger_schema :ContentGenerationDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :ContentGenerationOutput
            end
          end
        end
      end
    end
  end
end