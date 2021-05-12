module Swagger::IpLivestockBreedSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :IpLivestockBreed do
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
      property :colciencias_call_id do
        key :type, :integer
        key :format, :int64
      end
      property  :consecutive_number_ma do
        key :type, :string
      end
      property  :geo_city_id do
        key :type, :integer
        key :format, :int64
      end
      property  :observation do
        key :type, :string
      end
      property  :publication_date do
        key :type, :string
        key :format, :date
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

    swagger_schema :IpLivestockBreedInput do
      property :ip_livestock_breed do
        property :name do
          key :type, :string
        end
        property :category_id do
          key :type, :integer
          key :format, :int64
        end
        property  :consecutive_number_ma do
          key :type, :string
        end
        property  :geo_city_id do
          key :type, :integer
          key :format, :int64
        end
        property  :observation do
          key :type, :string
        end
        property  :publication_date do
          key :type, :string
          key :format, :date
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
      end
    end

    swagger_schema :IpLivestockBreedOutput do
      allOf do
        schema do
          key :'$ref', :IpLivestockBreed
        end
      end
    end

    swagger_schema :IpLivestockBreedDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :IpLivestockBreed
            end
          end
        end
        schema do
          property :data do
            key :type, :array
            items do
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
            end
          end
        end
      end
    end
  end
end