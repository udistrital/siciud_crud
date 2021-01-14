module Swagger::GeoCitySchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :GeoCity do
      key :required, [:id]
      property :id do
        key :type, :integer
        key :format, :int64
      end
      property :name do
        key :type, :string
      end
      property :code do
        key :type, :string
      end
      property :latitude do
        key :type, :number
        key :format, :float
      end
      property :longitude do
        key :type, :number
        key :format, :float
      end
      property :geo_state_id do
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

    swagger_schema :GeoCityInput do
      property :geo_city do
        property :name do
          key :type, :string
        end
        property :code do
          key :type, :string
        end
        property :latitude do
          key :type, :number
          key :format, :float
        end
        property :longitude do
          key :type, :number
          key :format, :float
        end
        property :geo_state_id do
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

    swagger_schema :GeoCityOutput do
      allOf do
        schema do
          key :'$ref', :GeoCity
        end
      end
    end
  end
end