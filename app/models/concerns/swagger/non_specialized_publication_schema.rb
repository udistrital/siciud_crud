module Swagger::NonSpecializedPublicationSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :NonSpecializedPublication do
      property :name do
        key :type, :string
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
      property :research_group_id do
        key :type, :integer
        key :format, :int64
      end
      property :target_audiences do
        key :type, :string
      end
      property :start_date do
        key :type, :string
        key :format, :date
      end
      property :observation do
        key :type, :string
      end
      property :url do
        key :type, :string
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :NonSpecializedPublicationInputPost do
      allOf do
        schema do
          property :non_specialized_publication do
            key :'$ref', :NonSpecializedPublication
          end
        end
        schema do
          property :non_specialized_publication do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :NonSpecializedPublicationInputPut do
      allOf do
        schema do
          property :non_specialized_publication do
            key :'$ref', :NonSpecializedPublication
          end
        end
        schema do
          property :non_specialized_publication do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :NonSpecializedPublicationOutput do
      allOf do
        schema do
          key :'$ref', :NonSpecializedPublication
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

    swagger_schema :NonSpecializedPublicationDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :NonSpecializedPublicationOutput
            end
          end
        end
      end
    end
  end
end