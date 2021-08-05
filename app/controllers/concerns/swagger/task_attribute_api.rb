module Swagger::TaskAttributeApi
    extend ActiveSupport::Concern
    include Swagger::Blocks
  
    included do
      swagger_path '/task_attributes/{id}' do
        operation :get do
          key :summary, 'Get a Task Attribute by ID'
          key :description, 'Returns a single Task Attribute'
          key :operationId, :get_task_attribute_by_id
          key :produces, ['application/json',]
          key :tags, ['TaskAttributes']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of TaskAttribute to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          response 200 do
            key :description, 'task attribute response'
            schema do
              key :'$ref', :TaskAttributeOutput
            end
          end
          response 404 do
            key :description, 'Not Found'
            schema do
              key :'$ref', :ErrorNotFound
            end
          end
          response :default do
            key :description, 'Unexpected Error'
          end
        end
  
        operation :put do
          key :summary, 'Update Task Attribute by ID'
          key :description, 'Returns the updated Task Attribute'
          key :operationId, :update_task_attribute
          key :produces, ['application/json',]
          key :tags, ['TaskAttributes']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of TaskAttribute to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          parameter name: :task_attribute do
            key :in, :body
            key :description, 'task attribute to update'
            key :required, true
            schema do
              key :'$ref', :TaskAttributeInputPut
            end
          end
  
          response 200 do
            key :description, 'task attribute response'
            schema do
              key :'$ref', :TaskAttributeOutput
            end
          end
          response 422 do
            key :description, 'Unprocessable Entity'
            schema do
              key :'$ref', :ErrorUnprocessableEntity
            end
          end
          response :default do
            key :description, 'Unexpected Error'
          end
        end
      end
  
      swagger_path '/task_models/{task_model_id}/task_attributes' do
        operation :get do
          key :summary, 'Get all TaskAttributes'
          key :description, 'Returns all Tasks Attributes'
          key :operationId, :get_task_attributes
          key :produces, ['application/json',]
          key :tags, ['TaskAttributes']
  
          parameter name: :task_model_id do
            key :in, :path
            key :description, 'ID of task model to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          response 200 do
            key :description, 'task attribute response'
            schema do
              key :type, :array
              items do
                key :'$ref', :TaskAttributeOutput
              end
            end
          end
          response :default do
            key :description, 'Unexpected Error'
          end
        end
  
        operation :post do
          key :summary, 'Create a new Task Attribute'
          key :description, 'Returns the created Task Attribute'
          key :operationId, :create_task_attribute
          key :produces, ['application/json',]
          key :tags, ['TaskAttributes']
  
          parameter name: :task_model_id do
            key :in, :path
            key :description, 'ID of task model to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          parameter name: :task_attribute do
            key :in, :body
            key :description, 'Task attribute to register'
            key :required, true
            schema do
              key :'$ref', :TaskAttributeInputPost
            end
          end
  
          response 201 do
            key :description, 'task attribute response'
            schema do
              key :'$ref', :TaskAttributeOutput
            end
          end
          response 422 do
            key :description, 'Unprocessable Entity'
            schema do
              key :'$ref', :ErrorUnprocessableEntity
            end
          end
          response :default do
            key :description, 'Unexpected Error'
          end
        end
      end
    end
  end