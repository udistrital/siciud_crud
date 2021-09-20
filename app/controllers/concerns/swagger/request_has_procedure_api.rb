module Swagger::RequestHasProcedureApi
    extend ActiveSupport::Concern
    include Swagger::Blocks
  
    included do
      swagger_path '/request_has_procedures/{id}' do
        operation :get do
          key :summary, 'Get a Request_has_procedure by ID'
          key :description, 'Returns a single request has procedures'
          key :operationId, :get_request_has_procedure_by_id
          key :produces, ['application/json',]
          key :tags, ['RequestHasProcedures']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of request has procedures to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          response 200 do
            key :description, 'request has procedures response'
            schema do
              key :'$ref', :RequestHasProcedureOutput
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
      end
  
      swagger_path '/request_has_procedures/' do
        operation :get do
          key :summary, 'Get all Request_has_procedures'
          key :description, 'Returns all request has procedures'
          key :operationId, :get_request_has_procedures
          key :produces, ['application/json',]
          key :tags, ['RequestHasProcedures']
  
          response 200 do
            key :description, 'Request has procedures response'
            schema do
              key :type, :array
              items do
                key :'$ref', :RequestHasProcedureOutput
              end
            end
          end
          response :default do
            key :description, 'Unexpected Error'
          end
        end

        operation :post do
          key :summary, 'Create a new Request_has_procedure'
          key :description, 'Returns the created request has procedure'
          key :operationId, :create_request_has_procedure
          key :produces, ['application/json',]
          key :tags, ['RequestHasProcedures']
  
          parameter name: :request_has_procedure do
            key :in, :body
            key :description, 'RequestHasProcedure to register'
            key :required, true
            schema do
              key :'$ref', :RequestHasProcedureInputPost
            end
          end
  
          response 201 do
            key :description, 'request has procedure response'
            schema do
              key :'$ref', :RequestHasProcedureOutput
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

      swagger_path '/request_has_procedures/{id}/active' do
        operation :put do
          key :summary, 'Activate or deactivate a Request_has_procedure by ID'
          key :description, 'Returns the activated/deactivated request has procedure by id'
          key :operationId, :change_active_request_has_procedure
          key :produces, ['application/json',]
          key :tags, ['RequestHasProcedures']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of Request has procedures to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          parameter name: :request_has_procedure do
            key :in, :body
            key :description, 'Request has procedure to update'
            key :required, true
            schema do
              property :request_has_procedure do
                key :'$ref', :ChangeActive
              end
            end
          end
  
          response 200 do
            key :description, 'request has procedure response'
            schema do
              key :'$ref', :RequestHasProcedureOutput
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