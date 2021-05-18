module Swagger::IndustrialDesignSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :IndustrialDesign do
      property :ind_dsg_registration_number do
        key :type, :string
      end
      property :ind_dsg_registration_title do
        key :type, :string
      end
      property :ind_dsg_date_of_obtaining do
        key :type, :string
        key :format, :date
      end
      property :ind_dsg_industrial_publication_gazette do
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

    swagger_schema :IndustrialDesignInputPost do
      allOf do
        schema do
          property :industrial_design do
            key :'$ref', :IndustrialDesign
          end
        end
        schema do
          property :industrial_design do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :IndustrialDesignInputPut do
      allOf do
        schema do
          property :industrial_design do
            key :'$ref', :IndustrialDesign
          end
        end
        schema do
          property :industrial_design do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :IndustrialDesignOutput do
      allOf do
        schema do
          key :'$ref', :IndustrialDesign
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
          property :research_group_id do
            key :type, :integer
            key :format, :int64
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

    swagger_schema :IndustrialDesignDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :IndustrialDesignOutput
            end
          end
        end
      end
    end
  end
end