module Swagger::TypeApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/types/{id}' do
      operation :get do
        key :summary, 'Get a Type by ID'
        key :description, 'Returns a single type'
        key :operationId, :get_type_by_id
        key :produces, ['application/json',]
        key :tags, ['Types']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of type to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'type response'
          schema do
            key :'$ref', :TypeOutput
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
        key :summary, 'Update Type by ID'
        key :description, 'Returns the updated type'
        key :operationId, :update_type
        key :produces, ['application/json',]
        key :tags, ['Types']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of type to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :type do
          key :in, :body
          key :description, 'Type to update'
          key :required, true
          schema do
            key :'$ref', :TypeInputPut
          end
        end

        response 200 do
          key :description, 'type response'
          schema do
            key :'$ref', :TypeOutput
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

    swagger_path '/types' do
      operation :get do
        key :summary, 'Get all Types'
        key :description, 'Returns all Types'
        key :operationId, :get_types
        key :produces, ['application/json',]
        key :tags, ['Types']

        response 200 do
          key :description, 'type response'
          schema do
            key :type, :array
            items do
              key :'$ref', :TypeOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Type'
        key :description, 'Returns the created type'
        key :operationId, :create_type
        key :produces, ['application/json',]
        key :tags, ['Types']

        parameter name: :type do
          key :in, :body
          key :description, 'Type to register'
          key :required, true
          schema do
            key :'$ref', :TypeInputPost
          end
        end

        response 201 do
          key :description, 'type response'
          schema do
            key :'$ref', :TypeOutput
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

    swagger_path '/types_all' do
      operation :get do
        key :summary, 'Get all Types with their subtypes'
        key :description, 'Returns all Types with their subtypes'
        key :operationId, :get_types_all
        key :produces, ['application/json',]
        key :tags, ['Types']

        response 200 do
          key :description, 'type response'
          schema do
            key :type, :array
            items do
              key :'$ref', :TypeAllDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end
    end
  end
end
