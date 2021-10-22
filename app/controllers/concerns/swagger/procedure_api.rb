module Swagger::ProcedureApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/procedures/{id}' do
      operation :get do
        key :summary, 'Get a Procedure by ID'
        key :description, 'Returns a single procedure'
        key :operationId, :get_procedure_by_id
        key :produces, ['application/json',]
        key :tags, ['Procedures']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of procedure to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'procedure response'
          schema do
            key :'$ref', :ProcedureOutput
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
        key :summary, 'Update Procedure by ID'
        key :description, 'Returns the updated Procedure'
        key :operationId, :update_procedure
        key :produces, ['application/json',]
        key :tags, ['Procedures']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Procedure to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :procedure do
          key :in, :body
          key :description, 'Procedure to update'
          key :required, true
          schema do
            key :'$ref', :ProcedureInputPut
          end
        end

        response 200 do
          key :description, 'procedure response'
          schema do
            key :'$ref', :ProcedureOutput
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

    swagger_path '/procedures/{id}/active' do
      operation :put do
        key :summary, 'Activate or deactivate a Procedure by ID'
        key :description, 'Returns the activated/deactivated procedure by id'
        key :operationId, :change_active_procedure
        key :produces, ['application/json',]
        key :tags, ['Procedures']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Procedure to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :procedure do
          key :in, :body
          key :description, 'Procedure to update'
          key :required, true
          schema do
            property :procedure do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'procedure response'
          schema do
            key :'$ref', :ProcedureOutput
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

    swagger_path '/procedures/' do
      operation :get do
        key :summary, 'Get all Procedures'
        key :description, 'Returns all procedures'
        key :operationId, :get_procedures
        key :produces, ['application/json',]
        key :tags, ['Procedures']

        response 200 do
          key :description, 'procedure response'
          schema do
            key :type, :array
            items do
              key :'$ref', :ProcedureOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end
      operation :post do
        key :summary, 'Create a new Procedure'
        key :description, 'Returns the created Procedure'
        key :operationId, :create_procedure
        key :produces, ['application/json',]
        key :tags, ['Procedures']

        parameter name: :procedure do
          key :in, :body
          key :description, 'Procedure to register'
          key :required, true
          schema do
            key :'$ref', :ProcedureInputPost
          end
        end

        response 201 do
          key :description, 'procedure response'
          schema do
            key :'$ref', :ProcedureOutput
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