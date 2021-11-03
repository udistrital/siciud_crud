module Swagger::BudgetApi
    extend ActiveSupport::Concern
    include Swagger::Blocks
  
    included do
      swagger_path '/budgets/{id}' do
        operation :get do
          key :summary, 'Get a Budget by ID'
          key :description, 'Returns a single Budget'
          key :operationId, :get_budget_by_id
          key :produces, ['application/json',]
          key :tags, ['Budgets']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of Budget to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          response 200 do
            key :description, 'Budget response'
            schema do
              key :'$ref', :BudgetOutput
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
          key :summary, 'Update Budget by ID'
          key :description, 'Returns the updated Budget'
          key :operationId, :update_budget
          key :produces, ['application/json',]
          key :tags, ['Budgets']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of Budget to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          parameter name: :budget do
            key :in, :body
            key :description, 'Budget to update'
            key :required, true
            schema do
              key :'$ref', :BudgetInputPut
            end
          end
  
          response 200 do
            key :description, 'Budget response'
            schema do
              key :'$ref', :BudgetOutput
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
  
      swagger_path '/tasks/{task_id}/budgets' do
        operation :get do
          key :summary, 'Get all Budgets'
          key :description, 'Returns all Tasks Attributes'
          key :operationId, :get_budgets
          key :produces, ['application/json',]
          key :tags, ['Budgets']
  
          parameter name: :task_id do
            key :in, :path
            key :description, 'ID of task to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          response 200 do
            key :description, 'Budget response'
            schema do
              key :type, :array
              items do
                key :'$ref', :BudgetOutput
              end
            end
          end
          response :default do
            key :description, 'Unexpected Error'
          end
        end
  
        operation :post do
          key :summary, 'Create a new Budget'
          key :description, 'Returns the created Budget'
          key :operationId, :create_budget
          key :produces, ['application/json',]
          key :tags, ['Budgets']
  
          parameter name: :task_id do
            key :in, :path
            key :description, 'ID of task to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          parameter name: :budget do
            key :in, :body
            key :description, 'Budget to register'
            key :required, true
            schema do
              key :'$ref', :BudgetInputPost
            end
          end
  
          response 201 do
            key :description, 'Budget response'
            schema do
              key :'$ref', :BudgetOutput
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

      swagger_path '/budgets/{id}/active' do
        operation :put do
          key :summary, 'Activate or deactivate a Budget by ID'
          key :description, 'Returns the activated/deactivated Budget by id'
          key :operationId, :change_active_budget
          key :produces, ['application/json',]
          key :tags, ['Budgets']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of Budget to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          parameter name: :budget do
            key :in, :body
            key :description, 'Budget to update'
            key :required, true
            schema do
              property :budget do
                key :'$ref', :ChangeActive
              end
            end
          end
  
          response 200 do
            key :description, 'Budget response'
            schema do
              key :'$ref', :BudgetOutput
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