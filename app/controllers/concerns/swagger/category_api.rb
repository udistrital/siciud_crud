module Swagger::CategoryApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/api/v1/categories/{id}' do
      operation :get do
        key :summary, 'Get Category by ID'
        key :description, 'Returns a single category'
        key :operationId, :get_category_by_id
        key :produces, ['application/json',]
        key :tags, [:Categories]

        parameter name: :id do
          key :in, :path
          key :description, 'ID of category to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'category response'
          schema do
            key :'$ref', :CategoryOutput
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
        key :summary, 'Update Category by ID'
        key :description, 'Returns the updated category'
        key :operationId, :update_category
        key :produces, ['application/json',]
        key :tags, [:Categories]

        parameter name: :id do
          key :in, :path
          key :description, 'ID of category to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end
        parameter name: :category do
          key :in, :body
          key :description, 'Category to update'
          key :required, true
          schema do
            key :'$ref', :CategoryInput
          end
        end

        response 200 do
          key :description, 'category response'
          schema do
            key :'$ref', :CategoryOutput
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

    swagger_path '/api/v1/categories/' do
      operation :get do
        key :summary, 'Get all Categories'
        key :description, 'Returns all categories'
        key :operationId, :get_categories
        key :produces, ['application/json',]
        key :tags, [:Categories]

        parameter name: :product_type_id do
          key :in, :query
          key :description, 'filter by product type'
          key :required, false
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'category response'
          schema do
            key :type, :array
            items do
              key :'$ref', :CategoryOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Category by ID'
        key :description, 'Returns the created category'
        key :operationId, :create_category
        key :produces, ['application/json',]
        key :tags, [:Categories]

        parameter name: :category do
          key :in, :body
          key :description, 'Category to register'
          key :required, true
          schema do
            key :'$ref', :CategoryInput
          end
        end

        response 201 do
          key :description, 'category response'
          schema do
            key :'$ref', :CategoryOutput
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
