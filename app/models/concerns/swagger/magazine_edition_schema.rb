
module Swagger::MagazineEditionSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :MagazineEdition do
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
      property :editorial_date do
        key :type, :string
        key :format, :date
      end
      property :editorial_name do
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
      property :issn do
        key :type, :string
      end
      property :research_group_id do
        key :type, :integer
        key :format, :int64
      end
      property :observation do
        key :type, :string
      end
      property :publication_year do
        key :type, :integer
        key :format, :int64
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :MagazineEditionInputPost do
      allOf do
        schema do
          property :magazine_edition do
            key :'$ref', :MagazineEdition
          end
        end
        schema do
          property :magazine_edition do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :MagazineEditionInputPut do
      allOf do
        schema do
          property :magazine_edition do
            key :'$ref', :MagazineEdition
          end
        end
        schema do
          property :magazine_edition do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :MagazineEditionOutput do
      allOf do
        schema do
          key :'$ref', :MagazineEdition
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

    swagger_schema :MagazineEditionDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :MagazineEditionOutput
            end
          end
        end
      end
    end
  end
end