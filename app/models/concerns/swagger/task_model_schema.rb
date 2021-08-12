module Swagger::TaskModelSchema
    extend ActiveSupport::Concern
    include Swagger::Blocks
  
  included do
    swagger_schema :TaskModel do
        key :required, [:id]
        property :name do
            key :type, :string
        end
        property :duration do
            key :type, :integer
            key :format, :int32
        end
        property :procedure_id do
            key :type, :integer
            key :format, :int64
        end
        property :professional_role_id do
            key :type, :integer
            key :format, :int64
        end
    end

    swagger_schema :TaskModelInputPost do
      allOf do
        schema do
          property :task_model do
            key :'$ref', :TaskModel
          end
        end
        schema do
          property :task_model do
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :TaskModelInputPut do
      allOf do
        schema do
          property :task_model do
            key :'$ref', :TaskModel
          end
        end
        schema do
          property :task_model do
            property :updated_by do
              key :type, :integer
              key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :TaskModelOutput do
      allOf do
        schema do
          key :'$ref', :TaskModel
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :procedure_name do
            key :type, :string
          end
          property :professional_role_name do
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
      end
    end
  end
end