module Swagger::OecdDisciplineSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :OecdDiscipline do
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
      property  :oecd_knowledge_subarea_id do
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

    swagger_schema :OecdDisciplineInput do
      property :oecd_discipline do
        key :required, [:name, :code]
        property :name do
          key :type, :string
        end
        property :code do
          key :type, :string
        end
        property  :oecd_knowledge_subarea_id do
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

    swagger_schema :OecdDisciplineOutput do
      allOf do
        schema do
          key :'$ref', :OecdDiscipline
        end
      end
    end
  end
end