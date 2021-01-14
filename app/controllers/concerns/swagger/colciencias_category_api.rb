module Swagger::ColcienciasCategoryApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/api/v1/colciencias_categories/{id}' do
      operation :get do
        key :summary, 'Get a Colciencias Category by ID'
        key :description, 'Returns a single colciencias category'
        key :operationId, :get_colciencias_category_by_id
        key :produces, ['application/json',]
        key :tags, ['Colciencias Categories']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of colciencias category to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'colciencias category response'
          schema do
            key :'$ref', :ColcienciasCategoryOutput
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
        key :summary, 'Update Colciencias Category by ID'
        key :description, 'Returns the updated colciencias category'
        key :operationId, :update_colciencias_category
        key :produces, ['application/json',]
        key :tags, ['Colciencias Categories']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of colciencias category to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :colciencias_category do
          key :in, :body
          key :description, 'Colciencias Category to update'
          key :required, true
          schema do
            key :'$ref', :ColcienciasCategoryInput
          end
        end

        response 200 do
          key :description, 'colciencias category response'
          schema do
            key :'$ref', :ColcienciasCategoryOutput
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

    swagger_path '/api/v1/colciencias_categories/' do
      operation :get do
        key :summary, 'Get all Colciencias Categories'
        key :description, 'Returns all colciencias categories'
        key :operationId, :get_colciencias_categories
        key :produces, ['application/json',]
        key :tags, ['Colciencias Categories']

        response 200 do
          key :description, 'colciencias category response'
          schema do
            key :type, :array
            items do
              key :'$ref', :ColcienciasCategoryOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Colciencias Category'
        key :description, 'Returns the created colciencias category'
        key :operationId, :create_colciencias_category
        key :produces, ['application/json',]
        key :tags, ['Colciencias Categories']

        parameter name: :colciencias_category do
          key :in, :body
          key :description, 'Colciencias Category to register'
          key :required, true
          schema do
            key :'$ref', :ColcienciasCategoryInput
          end
        end

        response 201 do
          key :description, 'colciencias category response'
          schema do
            key :'$ref', :ColcienciasCategoryOutput
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