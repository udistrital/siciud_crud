module Swagger::NewAnimalBreedSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :NewAnimalBreed do
      key :required, [:id]
      property :id do
        key :type, :integer
        key :format, :int64
      end
      property :name do
        key :type, :string
      end
      property :category_id do
        key :type, :integer
        key :format, :int64
      end
      property  :cycle_type_id do
        key :type, :integer
        key :format, :int64
      end
      property :date do
        key :type, :string
        key :format, :date
      end
      property  :geo_city_id do
        key :type, :integer
        key :format, :int64
      end
      property  :observation do
        key :type, :string
      end
      property  :petition_status_id do
        key :type, :integer
        key :format, :int64
      end
      property  :research_group_id do
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

    swagger_schema :NewAnimalBreedInput do
      property :new_animal_breed do
        property :name do
          key :type, :string
        end
        property :category_id do
          key :type, :integer
          key :format, :int64
        end
        property  :cycle_type_id do
          key :type, :integer
          key :format, :int64
        end
        property :date do
          key :type, :string
          key :format, :date
        end
        property  :geo_city_id do
          key :type, :integer
          key :format, :int64
        end
        property  :observation do
          key :type, :string
        end
        property  :petition_status_id do
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
      end
    end

    swagger_schema :NewAnimalBreedOutput do
      allOf do
        schema do
          key :'$ref', :NewAnimalBreed
        end
        schema do
          property :category_name do
            key :type, :string
          end
          property :cycle_type_name do
            key :type, :string
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
          property :petition_status_name do
            key :type, :string
          end
        end
      end
    end

    swagger_schema :NewAnimalBreedDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :NewAnimalBreedOutput
            end
          end
        end
      end
    end
  end
end