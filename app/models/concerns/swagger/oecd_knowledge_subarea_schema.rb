module Swagger::OecdKnowledgeSubareaSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :OecdKnowledgeSubarea do
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
      property :oecd_knowledge_area_id do
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

    swagger_schema :OecdKnowledgeSubareaInput do
      property :oecd_knowledge_subarea do
        key :required, [:name, :code]
        property :name do
          key :type, :string
        end
        property :code do
          key :type, :string
        end
        property  :oecd_knowledge_area_id do
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

    swagger_schema :OecdKnowledgeSubareaOutput do
      allOf do
        schema do
          key :'$ref', :OecdKnowledgeSubarea
        end
      end
    end
  end
end