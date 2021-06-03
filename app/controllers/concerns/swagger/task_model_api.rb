module Swagger::TaskModelApi
    extend ActiveSupport::Concern
    include Swagger::Blocks
  
    included do
      swagger_path '/task_models/{id}' do
        operation :get do
          key :summary, 'Get a Task Model by ID'
          key :description, 'Returns a single task model'
          key :operationId, :get_task_model_by_id
          key :produces, ['application/json',]
          key :tags, ['TaskModels']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of task model to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          response 200 do
            key :description, 'task model response'
            schema do
              key :'$ref', :TaskModelOutput
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
          key :summary, 'Update Task Model by ID'
          key :description, 'Returns the updated Task Model'
          key :operationId, :update_task_model
          key :produces, ['application/json',]
          key :tags, ['TaskModels']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of Task Model to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          parameter name: :task_model do
            key :in, :body
            key :description, 'TaskModel to update'
            key :required, true
            schema do
              key :'$ref', :TaskModelInputPut
            end
          end
  
          response 200 do
            key :description, 'task model response'
            schema do
              key :'$ref', :TaskModelOutput
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
  
      swagger_path '/task_models/' do
        operation :get do
          key :summary, 'Get all Task Models'
          key :description, 'Returns all task models'
          key :operationId, :get_task_models
          key :produces, ['application/json',]
          key :tags, ['TaskModels']
  
          response 200 do
            key :description, 'task model response'
            schema do
              key :type, :array
              items do
                key :'$ref', :TaskModelOutput
              end
            end
          end
          response :default do
            key :description, 'Unexpected Error'
          end
        end
        operation :post do
          key :summary, 'Create a new Task Model'
          key :description, 'Returns the created Task Model'
          key :operationId, :create_task_model
          key :produces, ['application/json',]
          key :tags, ['TaskModels']
  
          parameter name: :task_model do
            key :in, :body
            key :description, 'Task model to register'
            key :required, true
            schema do
              key :'$ref', :TaskModelInputPost
            end
          end
  
          response 201 do
            key :description, 'task model response'
            schema do
              key :'$ref', :TaskModelOutput
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