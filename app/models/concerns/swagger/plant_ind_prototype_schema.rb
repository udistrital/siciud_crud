module Swagger::PlantIndPrototypeSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :PlantIndPrototype do
      property :plt_name do
        key :type, :string
      end
      property :plt_registration_number do
        key :type, :string
      end
      property :plt_date_of_elaboration do
        key :type, :string
        key :format, :date
      end
      property :category_id do
        key :type, :integer
        key :format, :int64
      end
      property :research_group_id do
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
      property :institution_name do
        key :type, :string
      end
      property :plt_type_id do
        key :type, :integer
        key :format, :int64
      end
      property :geo_city_id do
        key :type, :integer
        key :format, :int64
      end
    end

    swagger_schema :PlantIndPrototypeInputPost do
      allOf do
        schema do
          property :plant_ind_prototype do
            key :'$ref', :PlantIndPrototype
          end
        end
        schema do
          property :plant_ind_prototype do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :PlantIndPrototypeInputPut do
      allOf do
        schema do
          property :plant_ind_prototype do
            key :'$ref', :PlantIndPrototype
          end
        end
        schema do
          property :plant_ind_prototype do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :PlantIndPrototypeOutput do
      allOf do
        schema do
          key :'$ref', :PlantIndPrototype
        end
        schema do
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
          property :geo_country_id do
            key :type, :integer
            key :format, :int64
          end
          property :geo_country_name do
            key :type, :string
          end
          property :geo_state_id do
            key :type, :integer
            key :format, :int64
          end
          property :geo_state_name do
            key :type, :string
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

    swagger_schema :PlantIndPrototypeDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :PlantIndPrototypeOutput
            end
          end
        end
      end
    end
  end
end