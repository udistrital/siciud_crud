module Swagger::OecdKnowledgeAreaSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :OecdKnowledgeArea do
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

    swagger_schema :OecdKnowledgeAreaInput do
      property :oecd_knowledge_area do
        key :required, [:name, :code]
        property :name do
          key :type, :string
        end
        property :code do
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
      end
    end

    swagger_schema :OecdKnowledgeAreaOutput do
      allOf do
        schema do
          key :'$ref', :OecdKnowledgeArea
        end
      end
    end
  end
end