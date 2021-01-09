module Swagger::CineDetailedAreaSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :CineDetailedArea do
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
      property :cine_specific_area_id do
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
        key :format, :'date-time'
      end
      property :updated_at do
        key :type, :string
        key :format, :'date-time'
      end
    end

    swagger_schema :CineDetailedAreaInput do
      property :cine_detailed_area do
        key :required, [:name, :code]
        property :name do
          key :type, :string
        end
        property :code do
          key :type, :string
        end
        property :cine_specific_area_id do
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

    swagger_schema :CineDetailedAreaOutput do
      allOf do
        schema do
          key :'$ref', :CineDetailedArea
        end
      end
    end
  end
end