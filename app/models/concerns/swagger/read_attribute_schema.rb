module Swagger::ReadAttributeSchema
    extend ActiveSupport::Concern
    include Swagger::Blocks
  
    included do
        swagger_schema :ReadAttribute do
            property :task_attribute_id do
                key :type, :integer
                key :format, :int64
            end
        end
  
        swagger_schema :ReadAttributeInputPost do
            allOf do
                schema do
                    property :read_attribute do
                        key :'$ref', :ReadAttribute
                    end
                end
                schema do
                    property :read_attribute do
                        property :created_by do
                            key :type, :integer
                            key :format, :int64
                        end
                    end
                end
            end
        end
  
        swagger_schema :ReadAttributeInputPut do
            allOf do
                schema do
                    property :read_attribute do
                        key :'$ref', :ReadAttribute
                    end
                end
                schema do
                    property :read_attribute do
                        property :updated_by do
                            key :type, :integer
                            key :format, :int64
                        end
                    end
                end
            end
        end
  
        swagger_schema :ReadAttributeOutput do
            allOf do
                schema do
                    key :'$ref', :ReadAttribute
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