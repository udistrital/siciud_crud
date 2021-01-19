module Swagger::ProductTypeApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/product_types/{id}' do
      operation :get do
        key :summary, 'Get Product Type by ID'
        key :description, 'Returns a single product type'
        key :operationId, :get_product_type_by_id
        key :produces, ['application/json',]
        key :tags, ['Product Types']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of product type to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'product type response'
          schema do
            key :'$ref', :ProductTypeOutput
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
        key :summary, 'Update Product Type by ID'
        key :description, 'Returns the updated product type'
        key :operationId, :update_product_type
        key :produces, ['application/json',]
        key :tags, ['Product Types']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of product type to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end
        parameter name: :product_type do
          key :in, :body
          key :description, 'product type to update'
          key :required, true
          schema do
            key :'$ref', :ProductTypeInput
          end
        end

        response 200 do
          key :description, 'product type response'
          schema do
            key :'$ref', :ProductTypeOutput
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

    swagger_path '/product_types/' do
      operation :get do
        key :summary, 'Get all Product Types'
        key :description, 'Returns all product types'
        key :operationId, :get_product_types
        key :produces, ['application/json',]
        key :tags, ['Product Types']

        response 200 do
          key :description, 'product type response'
          schema do
            key :type, :array
            items do
              key :'$ref', :ProductTypeOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Product Type'
        key :description, 'Returns the created product type'
        key :operationId, :create_product_type
        key :produces, ['application/json',]
        key :tags, ['Product Types']

        parameter name: :ProductType do
          key :in, :body
          key :description, 'product type to register'
          key :required, true
          schema do
            key :'$ref', :ProductTypeInput
          end
        end

        response 201 do
          key :description, 'product type response'
          schema do
            key :'$ref', :ProductTypeOutput
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