module Swagger::EditorialApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/api/v1/editorials/{id}' do
      operation :get do
        key :summary, 'Get a Editorial by ID'
        key :description, 'Returns a single editorial'
        key :operationId, :get_editorial_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::Editorials']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of editorial to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'editorial response'
          schema do
            key :'$ref', :EditorialOutput
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
        key :summary, 'Update Editorial by ID'
        key :description, 'Returns the updated editorial'
        key :operationId, :update_editorial
        key :produces, ['application/json',]
        key :tags, ['Products::Editorials']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of editorial to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :editorial do
          key :in, :body
          key :description, 'Editorial to update'
          key :required, true
          schema do
            key :'$ref', :EditorialInput
          end
        end

        response 200 do
          key :description, 'editorial response'
          schema do
            key :'$ref', :EditorialOutput
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

    swagger_path '/api/v1/editorials/' do
      operation :get do
        key :summary, 'Get all Editorials'
        key :description, 'Returns all editorials'
        key :operationId, :get_editorials
        key :produces, ['application/json',]
        key :tags, ['Products::Editorials']

        response 200 do
          key :description, 'editorial response'
          schema do
            key :type, :array
            items do
              key :'$ref', :EditorialOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Editorial'
        key :description, 'Returns the created editorial'
        key :operationId, :create_editorial
        key :produces, ['application/json',]
        key :tags, ['Products::Editorials']

        parameter name: :editorial do
          key :in, :body
          key :description, 'Editorial to register'
          key :required, true
          schema do
            key :'$ref', :EditorialInput
          end
        end

        response 201 do
          key :description, 'editorial response'
          schema do
            key :'$ref', :EditorialOutput
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