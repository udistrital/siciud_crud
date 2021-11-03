module Swagger::TaskSchema
    extend ActiveSupport::Concern
    include Swagger::Blocks
  
  included do
    swagger_schema :Task do
        key :required, [:id]
        property :intelectual_property_id do
            key :type, :integer
            key :format, :int64
        end
    end

    swagger_schema :TaskInputPost do
      allOf do
        schema do
          property :task do
            key :'$ref', :Task
          end
        end
        schema do
          property :task do
                property :expired_date do
                    key :type, :string
                    key :format, 'date'
                end
                property :task_model_id do
                    key :type, :integer
                    key :format, :int64
                end
                property :otri_professional_id do
                    key :type, :integer
                    key :format, :int64
                end
                property :created_by do
                    key :type, :integer
                    key :format, :int64
                end
          end
        end
      end
    end

    swagger_schema :TaskInputPut do
      allOf do
        schema do
          property :task do
            key :'$ref', :Task
          end
        end
        schema do
          property :task do
            property :desition do
                key :type, :boolean
                key :default, true
            end
            property :updated_by do
                key :type, :integer
                key :format, :int64
            end
          end
        end
      end
    end

    swagger_schema :TaskOutput do
      allOf do
        schema do
          key :'$ref', :Task
        end
        schema do
          property :id do
            key :type, :integer
            key :format, :int64
          end
          property :task_model_id do
            key :type, :integer
            key :format, :int64
          end
          property :request_has_procedure_id do
            key :type, :integer
            key :format, :int64
          end
          property :otri_professional_id do
            key :type, :integer
            key :format, :int64
          end
          property :desition do
            key :type, :boolean
            key :default, true
          end
          property :expired_date do
            key :type, :string
            key :format, 'date'
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