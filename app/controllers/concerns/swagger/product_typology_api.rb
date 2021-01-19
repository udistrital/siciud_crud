module Swagger::ProductTypologyApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/product_typologies/{id}' do
      operation :get do
        key :summary, 'Get Product Typology by ID'
        key :description, 'Returns a single product typology'
        key :operationId, :get_product_typology_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::Product Typologies']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of product typology to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'product typology response'
          schema do
            key :'$ref', :ProductTypologyOutput
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
        key :summary, 'Update Product Typology by ID'
        key :description, 'Returns the updated product typology'
        key :operationId, :update_product_typology
        key :produces, ['application/json',]
        key :tags, ['Products::Product Typologies']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of product typology to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end
        parameter name: :product_typology do
          key :in, :body
          key :description, 'product typology to update'
          key :required, true
          schema do
            key :'$ref', :ProductTypologyInput
          end
        end

        response 200 do
          key :description, 'product typology response'
          schema do
            key :'$ref', :ProductTypologyOutput
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

    swagger_path '/product_typologies/' do
      operation :get do
        key :summary, 'Get all Product Typologies'
        key :description, 'Returns all product typologies'
        key :operationId, :get_product_typologies
        key :produces, ['application/json',]
        key :tags, ['Products::Product Typologies']

        response 200 do
          key :description, 'product typology response'
          schema do
            key :type, :array
            items do
              key :'$ref', :ProductTypologyOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Product Typology'
        key :description, 'Returns the created Product Typology'
        key :operationId, :create_product_typology
        key :produces, ['application/json',]
        key :tags, ['Products::Product Typologies']

        parameter name: :product_typology do
          key :in, :body
          key :description, 'product typology to register'
          key :required, true
          schema do
            key :'$ref', :ProductTypologyInput
          end
        end

        response 201 do
          key :description, 'product typology response'
          schema do
            key :'$ref', :ProductTypologyOutput
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