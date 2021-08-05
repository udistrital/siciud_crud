module Swagger::TaskAttributeSchema
    extend ActiveSupport::Concern
    include Swagger::Blocks
  
    included do
        swagger_schema :TaskAttribute do
            property :attribute_sub_type_id do
                key :type, :integer
                key :format, :int64
            end
        end
  
        swagger_schema :TaskAttributeInputPost do
            allOf do
                schema do
                    property :task_attribute do
                        key :'$ref', :TaskAttribute
                    end
                end
                schema do
                    property :task_attribute do
                        property :created_by do
                            key :type, :integer
                            key :format, :int64
                        end
                    end
                end
            end
        end
  
        swagger_schema :TaskAttributeInputPut do
            allOf do
                schema do
                    property :task_attribute do
                        key :'$ref', :TaskAttribute
                    end
                end
                schema do
                    property :task_attribute do
                        property :updated_by do
                            key :type, :integer
                            key :format, :int64
                        end
                    end
                end
            end
        end
  
        swagger_schema :TaskAttributeOutput do
            allOf do
                schema do
                    key :'$ref', :TaskAttribute
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