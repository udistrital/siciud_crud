module Swagger::PublicationSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :Publication do
      property :active do
        key :type, :boolean
        key :default, true
      end
      property :category_id do
        key :type, :integer
        key :format, :int64
      end
      property :circulation_route do
        key :type, :string
      end
      property :colciencias_call_id do
        key :type, :integer
        key :format, :int64
      end
      property :duration do
        key :type, :integer
        key :format, :int64
      end
      property :duration_type_id do
        key :type, :integer
        key :format, :int64
      end
      property :final_date do
        key :type, :string
        key :format, :date
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
      property :name do
        key :type, :string
      end
      property :observation do
        key :type, :string
      end
      property :product_type_id do
        key :type, :integer
        key :format, :int64
      end
      property :research_group_id do
        key :type, :integer
        key :format, :int64
      end
      property :start_date do
        key :type, :string
        key :format, :date
      end
      property :target_audiences do
        key :type, :string
      end
      property :url do
        key :type, :string
      end
    end

    swagger_schema :PublicationInputPost do
      allOf do
        schema do
          property :publication do
            key :'$ref', :Publication
          end
        end
        schema do
          property :publication do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :PublicationInputPut do
      allOf do
        schema do
          property :publication do
            key :'$ref', :Publication
          end
        end
        schema do
          property :publication do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :PublicationOutput do
      allOf do
        schema do
          key :'$ref', :Publication
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
          property :duration_type_name do
            key :type, :string
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

    swagger_schema :PublicationDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :PublicationOutput
            end
          end
        end
      end
    end
  end
end