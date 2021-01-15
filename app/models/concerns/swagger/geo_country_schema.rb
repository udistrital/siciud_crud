module Swagger::GeoCountrySchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :GeoCountry do
      key :required, [:id]
      property :id do
        key :type, :integer
        key :format, :int64
      end
      property :name do
        key :type, :string
      end
      property :iso2 do
        key :type, :string
        key :maxLength, 2
      end
      property :iso3 do
        key :type, :string
        key :maxLength, 3
      end
      property :capital_name do
        key :type, :string
        key :maxLength, 255
      end
      property :currency do
        key :type, :string
        key :maxLength, 10
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

    swagger_schema :GeoCountryInput do
      property :geo_city do
        property :name do
          key :type, :string
        end
        property :iso2 do
          key :type, :string
          key :maxLength, 2
        end
        property :iso3 do
          key :type, :string
          key :maxLength, 3
        end
        property :capital_name do
          key :type, :string
          key :maxLength, 255
        end
        property :currency do
          key :type, :string
          key :maxLength, 10
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

    swagger_schema :GeoCountryOutput do
      allOf do
        schema do
          key :'$ref', :GeoCountry
        end
      end
    end
  end
end