module Swagger::EntitySchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :Entity do
      property :name do
        key :type, :string
      end
      property :nit do
        key :type, :string
      end
      property :check_digit do
        key :type, :integer
        key :minimum, 0
        key :maximum, 9
      end
      property :constitution_date do
        key :type, :string
        key :format, :date
      end
      property :email do
        key :type, :string
      end
      property :headquarters_address do
        key :type, :string
      end
      property :institution_type_id do
        key :type, :integer
        key :format, :int64
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
      property :legal_nature_id do
        key :type, :integer
        key :format, :int64
      end
      property :phone do
        key :type, :string
      end
      property :registration do
        key :type, :string
      end
      property :web_page do
        key :type, :string
      end
      property :active do
        key :type, :boolean
        key :default, true
      end
    end

    swagger_schema :EntityInputPost do
      allOf do
        schema do
          property :entity do
            key :'$ref', :Entity
          end
        end
        schema do
          property :entity do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :EntityInputPut do
      allOf do
        schema do
          property :entity do
            key :'$ref', :Entity
          end
        end
        schema do
          property :entity do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :EntityOutput do
      allOf do
        schema do
          key :'$ref', :Entity
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :institution_type_name do
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
          property :legal_nature_name do
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

    swagger_schema :EntityDxOutput do
      allOf do
        schema do
          property :data do
            key :type, :array
            items do
              key :'$ref', :EntityOutput
            end
          end
        end
      end
    end
  end
end