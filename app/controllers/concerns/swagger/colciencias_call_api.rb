module Swagger::ColcienciasCallApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/colciencias_calls/{id}' do
      operation :get do
        key :summary, 'Get a Colciencias Call by ID'
        key :description, 'Returns a single colciencias call'
        key :operationId, :get_colciencias_call_by_id
        key :produces, ['application/json',]
        key :tags, ['Colciencias Calls']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of colciencias call to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'colciencias call response'
          schema do
            key :'$ref', :ColcienciasCallOutput
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
        key :summary, 'Update Colciencias Call by ID'
        key :description, 'Returns the updated colciencias call'
        key :operationId, :update_colciencias_call
        key :produces, ['application/json',]
        key :tags, ['Colciencias Calls']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of colciencias call to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :colciencias_call do
          key :in, :body
          key :description, 'Colciencias Call to update'
          key :required, true
          schema do
            key :'$ref', :ColcienciasCallInput
          end
        end

        response 200 do
          key :description, 'colciencias call response'
          schema do
            key :'$ref', :ColcienciasCallOutput
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

    swagger_path '/colciencias_calls' do
      operation :get do
        key :summary, 'Get all Colciencias Calls'
        key :description, 'Returns all colciencias calls'
        key :operationId, :get_colciencias_calls
        key :produces, ['application/json',]
        key :tags, ['Colciencias Calls']

        response 200 do
          key :description, 'colciencias call response'
          schema do
            key :type, :array
            items do
              key :'$ref', :ColcienciasCallOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Colciencias Call'
        key :description, 'Returns the created colciencias call'
        key :operationId, :create_colciencias_call
        key :produces, ['application/json',]
        key :tags, ['Colciencias Calls']

        parameter name: :colciencias_call do
          key :in, :body
          key :description, 'Colciencias Call to register'
          key :required, true
          schema do
            key :'$ref', :ColcienciasCallInput
          end
        end

        response 201 do
          key :description, 'colciencias call response'
          schema do
            key :'$ref', :ColcienciasCallOutput
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