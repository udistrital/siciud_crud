module Swagger::TaskHasStateApi
    extend ActiveSupport::Concern
    include Swagger::Blocks
  
    included do

      swagger_path '/tasks/{task_id}/task_has_states/' do
        operation :get do
          key :summary, 'Get all task_has_states of one task'
          key :description, 'Returns all Task has states of one task'
          key :operationId, :get_task_has_states
          key :produces, ['application/json',]
          key :tags, ['TaskHasStates']
            
          parameter name: :task_id do
            key :in, :path
            key :description, 'ID of task to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end

          response 200 do
            key :description, 'Task has states response'
            schema do
              key :type, :array
              items do
                key :'$ref', :TaskHasStateOutput
              end
            end
          end
          response :default do
            key :description, 'Unexpected Error'
          end
        end

        operation :post do
          key :summary, 'Create a new task_has_state'
          key :description, 'Returns the created Task has state'
          key :operationId, :create_task_has_state
          key :produces, ['application/json',]
          key :tags, ['TaskHasStates']
            
          parameter name: :task_id do
            key :in, :path
            key :description, 'ID of task to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          
          parameter name: :task_has_state do
            key :in, :body
            key :description, 'TaskHasState to register'
            key :required, true
            schema do
              key :'$ref', :TaskHasStateInputPost
            end
          end
  
          response 201 do
            key :description, 'Task has state response'
            schema do
              key :'$ref', :TaskHasStateOutput
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

      swagger_path '/task_has_states/{id}/active' do
        operation :put do
          key :summary, 'Activate or deactivate a task_has_state by ID'
          key :description, 'Returns the activated/deactivated Task has state by id'
          key :operationId, :change_active_task_has_state
          key :produces, ['application/json',]
          key :tags, ['TaskHasStates']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of Task has states to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          parameter name: :task_has_state do
            key :in, :body
            key :description, 'Task has state to update'
            key :required, true
            schema do
              property :task_has_state do
                key :'$ref', :ChangeActive
              end
            end
          end
  
          response 200 do
            key :description, 'Task has state response'
            schema do
              key :'$ref', :TaskHasStateOutput
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