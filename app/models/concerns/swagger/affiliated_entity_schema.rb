module Swagger::AffiliatedEntitySchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :AffiliatedEntity do
      property :research_network_id do
        key :type, :integer
        key :format, :int64
      end
      property :entity_id do
        key :type, :integer
        key :format, :int64
      end
      property :institution_type_id do
        key :type, :integer
        key :format, :int64
      end
      property :geo_country_id do
        key :type, :integer
        key :format, :int64
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :AffiliatedEntityInputPost do
      allOf do
        schema do
          property :affiliated_entity do
            key :'$ref', :AffiliatedEntity
          end
        end
        schema do
          property :affiliated_entity do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :AffiliatedEntityInputPut do
      allOf do
        schema do
          property :affiliated_entity do
            key :'$ref', :AffiliatedEntity
          end
        end
        schema do
          property :affiliated_entity do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :AffiliatedEntityOutput do
      allOf do
        schema do
          key :'$ref', :AffiliatedEntity
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :research_network_name do
            key :type, :string
          end
          property :entity_name do
            key :type, :string
          end
          property :institution_type_name do
            key :type, :string
          end
          property :geo_country_name do
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

    swagger_schema :AffiliatedEntityDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :AffiliatedEntityOutput
            end
          end
        end
      end
    end
  end
end