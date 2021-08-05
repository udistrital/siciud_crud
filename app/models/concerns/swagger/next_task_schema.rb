module Swagger::NextTaskSchema
    extend ActiveSupport::Concern
    include Swagger::Blocks
  
    included do
        swagger_schema :NextTask do
            property :following_task_id do
                key :type, :integer
                key :format, :int64
            end
        end
  
        swagger_schema :NextTaskInputPost do
            allOf do
                schema do
                    property :next_task do
                        key :'$ref', :NextTask
                    end
                end
                schema do
                    property :next_task do
                        property :created_by do
                            key :type, :integer
                            key :format, :int64
                        end
                    end
                end
            end
        end
  
        swagger_schema :NextTaskInputPut do
            allOf do
                schema do
                    property :next_task do
                        key :'$ref', :NextTask
                    end
                end
                schema do
                    property :next_task do
                        property :updated_by do
                            key :type, :integer
                            key :format, :int64
                        end
                    end
                end
            end
        end
  
        swagger_schema :NextTaskOutput do
            allOf do
                schema do
                    key :'$ref', :NextTask
                end
                schema do
                    property :id do
                        key :type, :integer
                        key :format, :int64
                    end
                    property :actual_task_id do
                        key :type, :integer
                        key :format, :int64
                    end
                    property :following_task_id do
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