module Swagger::ProcedureRequestApi
    extend ActiveSupport::Concern
    include Swagger::Blocks
  
    included do
      swagger_path '/procedure_requests/{id}' do
        operation :get do
          key :summary, 'Get a procedure_request by ID'
          key :description, 'Returns a single Procedure request'
          key :operationId, :get_procedure_request_by_id
          key :produces, ['application/json',]
          key :tags, ['ProcedureRequests']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of Procedure request to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          response 200 do
            key :description, 'Procedure request response'
            schema do
              key :'$ref', :ProcedureRequestOutput
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
          key :summary, 'Update procedure_request by ID'
          key :description, 'Returns the updated Procedure request'
          key :operationId, :update_procedure_request
          key :produces, ['application/json',]
          key :tags, ['ProcedureRequests']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of Procedure request to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          parameter name: :procedure_request do
            key :in, :body
            key :description, 'Procedure request to update'
            key :required, true
            schema do
              key :'$ref', :ProcedureRequestInputPut
            end
          end
  
          response 200 do
            key :description, 'Procedure request response'
            schema do
              key :'$ref', :ProcedureRequestOutput
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
  
      swagger_path '/procedure_requests/' do
        operation :get do
          key :summary, 'Get all procedure_requests'
          key :description, 'Returns all Procedure requests'
          key :operationId, :get_procedure_requests
          key :produces, ['application/json',]
          key :tags, ['ProcedureRequests']
  
          response 200 do
            key :description, 'Procedure request response'
            schema do
              key :type, :array
              items do
                key :'$ref', :ProcedureRequestOutput
              end
            end
          end
          response :default do
            key :description, 'Unexpected Error'
          end
        end
        operation :post do
          key :summary, 'Create a new procedure_request'
          key :description, 'Returns the created Procedure request'
          key :operationId, :create_procedure_request
          key :produces, ['application/json',]
          key :tags, ['ProcedureRequests']
  
          parameter name: :procedure_request do
            key :in, :body
            key :description, 'Procedure request to register'
            key :required, true
            schema do
              key :'$ref', :ProcedureRequestInputPost
            end
          end
  
          response 201 do
            key :description, 'Procedure request response'
            schema do
              key :'$ref', :ProcedureRequestOutput
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

      swagger_path '/procedure_requests/{id}/active' do
        operation :put do
          key :summary, 'Activate or deactivate a Procedure request by ID'
          key :description, 'Returns the activated/deactivated Procedure request by id'
          key :operationId, :change_active_procedure_request
          key :produces, ['application/json',]
          key :tags, ['ProcedureRequests']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of Procedure request to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          parameter name: :procedure_request do
            key :in, :body
            key :description, 'Procedure request to update'
            key :required, true
            schema do
              property :procedure_request do
                key :'$ref', :ChangeActive
              end
            end
          end
  
          response 200 do
            key :description, 'Procedure request response'
            schema do
              key :'$ref', :ProcedureRequestOutput
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