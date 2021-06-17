
module Swagger::InformativeBulletinSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :InformativeBulletin do
      property :category_id do
        key :type, :integer
        key :format, :int64
      end
      property :colciencias_call_id do
        key :type, :integer
        key :format, :int64
      end
      property :elaboration_date do
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
      property :institution do
        key :type, :string
      end
      property :observation do
        key :type, :string
      end
      property :research_group_id do
        key :type, :integer
        key :format, :int64
      end
      property :title do
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

    swagger_schema :InformativeBulletinInputPost do
      allOf do
        schema do
          property :informative_bulletin do
            key :'$ref', :InformativeBulletin
          end
        end
        schema do
          property :informative_bulletin do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :InformativeBulletinInputPut do
      allOf do
        schema do
          property :informative_bulletin do
            key :'$ref', :InformativeBulletin
          end
        end
        schema do
          property :informative_bulletin do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :InformativeBulletinOutput do
      allOf do
        schema do
          key :'$ref', :InformativeBulletin
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

    swagger_schema :InformativeBulletinDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :InformativeBulletinOutput
            end
          end
        end
      end
    end
  end
end