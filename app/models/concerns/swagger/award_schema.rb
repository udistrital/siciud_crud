module Swagger::AwardSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :Award do
      key :required, [:id]
      property :id do
        key :type, :integer
        key :format, :int64
      end
      property :name do
        key :type, :string
      end
      property :is_national do
        key :type, :boolean
      end
      property :research_creation_work_id do
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

    swagger_schema :AwardInput do
      property :award do
        key :required, [:name, :product_type_id]
        property :name do
          key :type, :string
        end
        property :is_national do
          key :type, :boolean
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

    swagger_schema :AwardOutput do
      allOf do
        schema do
          key :'$ref', :Award
        end
      end
    end
  end
end