module Swagger::NextTaskApi
    extend ActiveSupport::Concern
    include Swagger::Blocks
  
    included do
      swagger_path '/next_tasks/{id}' do
        operation :get do
          key :summary, 'Get a Next Task by ID'
          key :description, 'Returns a single Next Task'
          key :operationId, :get_next_task_by_id
          key :produces, ['application/json',]
          key :tags, ['NextTasks']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of NextTask to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          response 200 do
            key :description, 'next task response'
            schema do
              key :'$ref', :NextTaskOutput
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
          key :summary, 'Update Next Task by ID'
          key :description, 'Returns the updated Next Task'
          key :operationId, :update_next_task
          key :produces, ['application/json',]
          key :tags, ['NextTasks']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of NextTask to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          parameter name: :next_task do
            key :in, :body
            key :description, 'Next task to update'
            key :required, true
            schema do
              key :'$ref', :NextTaskInputPut
            end
          end
  
          response 200 do
            key :description, 'next task response'
            schema do
              key :'$ref', :NextTaskOutput
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
  
      swagger_path '/task_models/{task_model_id}/next_tasks' do
        operation :get do
          key :summary, 'Get all NextTasks'
          key :description, 'Returns all Next Tasks'
          key :operationId, :get_next_tasks
          key :produces, ['application/json',]
          key :tags, ['NextTasks']
  
          parameter name: :task_model_id do
            key :in, :path
            key :description, 'ID of task model to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          response 200 do
            key :description, 'next task response'
            schema do
              key :type, :array
              items do
                key :'$ref', :NextTaskOutput
              end
            end
          end
          response :default do
            key :description, 'Unexpected Error'
          end
        end
  
        operation :post do
          key :summary, 'Create a new Next Task'
          key :description, 'Returns the created Next Task'
          key :operationId, :create_next_task
          key :produces, ['application/json',]
          key :tags, ['NextTasks']
  
          parameter name: :task_model_id do
            key :in, :path
            key :description, 'ID of task model to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          parameter name: :next_task do
            key :in, :body
            key :description, 'Next task to register'
            key :required, true
            schema do
              key :'$ref', :NextTaskInputPost
            end
          end
  
          response 201 do
            key :description, 'next task response'
            schema do
              key :'$ref', :NextTaskOutput
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