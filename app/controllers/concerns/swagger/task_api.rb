module Swagger::TaskApi
    extend ActiveSupport::Concern
    include Swagger::Blocks
  
    included do
      swagger_path '/tasks/{id}' do
        operation :get do
          key :summary, 'Get a Task by ID'
          key :description, 'Returns a single Task'
          key :operationId, :get_task_by_id
          key :produces, ['application/json',]
          key :tags, ['Tasks']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of Task to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          response 200 do
            key :description, 'Task response'
            schema do
              key :'$ref', :TaskOutput
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
          key :summary, 'Update Task by ID'
          key :description, 'Returns the updated Task'
          key :operationId, :update_task
          key :produces, ['application/json',]
          key :tags, ['Tasks']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of Task to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          parameter name: :task do
            key :in, :body
            key :description, 'Task to update'
            key :required, true
            schema do
              key :'$ref', :TaskInputPut
            end
          end
  
          response 200 do
            key :description, 'Task response'
            schema do
              key :'$ref', :TaskOutput
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
  
      swagger_path '/request_has_procedures/{request_has_procedure_id}/tasks' do
        operation :get do
          key :summary, 'Get all Tasks'
          key :description, 'Returns all Tasks'
          key :operationId, :get_tasks
          key :produces, ['application/json',]
          key :tags, ['Tasks']
  
          parameter name: :request_has_procedure_id do
            key :in, :path
            key :description, 'ID of request has procedure to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          response 200 do
            key :description, 'Task response'
            schema do
              key :type, :array
              items do
                key :'$ref', :TaskOutput
              end
            end
          end
          response :default do
            key :description, 'Unexpected Error'
          end
        end
  
        operation :post do
          key :summary, 'Create a new Task'
          key :description, 'Returns the created Task'
          key :operationId, :create_task
          key :produces, ['application/json',]
          key :tags, ['Tasks']
  
          parameter name: :request_has_procedure_id do
            key :in, :path
            key :description, 'ID of request has procedure to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          parameter name: :task do
            key :in, :body
            key :description, 'Task to register'
            key :required, true
            schema do
              key :'$ref', :TaskInputPost
            end
          end
  
          response 201 do
            key :description, 'Task response'
            schema do
              key :'$ref', :TaskOutput
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

      swagger_path '/tasks/{id}/active' do
        operation :put do
          key :summary, 'Activate or deactivate a Task by ID'
          key :description, 'Returns the activated/deactivated Task by id'
          key :operationId, :change_active_task
          key :produces, ['application/json',]
          key :tags, ['Tasks']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of Task to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          parameter name: :task do
            key :in, :body
            key :description, 'Task to update'
            key :required, true
            schema do
              property :task do
                key :'$ref', :ChangeActive
              end
            end
          end
  
          response 200 do
            key :description, 'Task response'
            schema do
              key :'$ref', :TaskOutput
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