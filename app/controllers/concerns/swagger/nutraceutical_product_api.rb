module Swagger::NutraceuticalProductApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/nutraceutical_products/{id}' do
      operation :get do
        key :summary, 'Get a Nutraceutical Product by ID'
        key :description, 'Returns a single Nutraceutical Product'
        key :operationId, :get_nutraceutical_product_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Nutraceutical Products']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Nutraceutical Product to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'Nutraceutical Product response'
          schema do
            key :'$ref', :NutraceuticalProductOutput
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
        key :summary, 'Update Nutraceutical Product by ID'
        key :description, 'Returns the updated Nutraceutical Product'
        key :operationId, :update_nutraceutical_product
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Nutraceutical Products']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Nutraceutical Product to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :nutraceutical_product do
          key :in, :body
          key :description, 'Nutraceutical Product to update'
          key :required, true
          schema do
            key :'$ref', :NutraceuticalProductInputPut
          end
        end

        response 200 do
          key :description, 'Nutraceutical Product response'
          schema do
            key :'$ref', :NutraceuticalProductOutput
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

      operation :patch do
        key :summary, 'Activate or deactivate a Nutraceutical Product by ID'
        key :description, 'Returns the activated/deactivated Nutraceutical Product'
        key :operationId, :change_active_nutraceutical_product
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Nutraceutical Products']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Nutraceutical Product to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :nutraceutical_product do
          key :in, :body
          key :description, 'Nutraceutical Product to update'
          key :required, true
          schema do
            property :nutraceutical_product do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'Nutraceutical Product response'
          schema do
            key :'$ref', :NutraceuticalProductOutput
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

    swagger_path '/research_units/{research_group_id}/nutraceutical_products' do
      operation :get do
        key :summary, 'Get all Nutraceutical Products'
        key :description, 'Returns all Nutraceutical Products'
        key :operationId, :get_nutraceutical_products
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Nutraceutical Products']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'Nutraceutical Product response'
          schema do
            key :type, :array
            items do
              key :'$ref', :NutraceuticalProductDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Nutraceutical Products'
        key :description, 'Returns the created Nutraceutical Product'
        key :operationId, :create_nutraceutical_product
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Nutraceutical Products']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :nutraceutical_product do
          key :in, :body
          key :description, 'Nutraceutical Product to register'
          key :required, true
          schema do
            key :'$ref', :NutraceuticalProductInputPost
          end
        end

        response 201 do
          key :description, 'Nutraceutical Product response'
          schema do
            key :'$ref', :NutraceuticalProductOutput
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