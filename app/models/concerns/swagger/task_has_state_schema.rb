module Swagger::TaskHasStateSchema
    extend ActiveSupport::Concern
    include Swagger::Blocks
  
    included do
      swagger_schema :TaskHasState do
        key :required, [:id]
      end
  
      swagger_schema :TaskHasStateInputPost do
        allOf do
          schema do
            property :task_has_state do
              key :'$ref', :TaskHasState
            end
          end
          schema do
            property :task_has_state do
              property :created_by do
                key :type, :integer
                key :format, :int64
              end
              property :state_id do
                key :type, :integer
                key :format, :int64
               end
            end
          end
        end
      end
  
      swagger_schema :TaskHasStateOutput do
        allOf do
          schema do
            key :'$ref', :TaskHasState
          end
          schema do
            property :id do
              key :type, :integer
              key :format, :int64
            end
            property :task_id do
                key :type, :integer
                key :format, :int64
            end
            property :state_id do
                key :type, :integer
                key :format, :int64
            end
            property :created_by do
              key :type, :integer
              key :format, :int64
            end
            property :active do
              key :type, :boolean
              key :default, true
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