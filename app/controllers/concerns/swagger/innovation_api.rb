module Swagger::InnovationApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/innovations/{id}' do
      operation :get do
        key :summary, 'Get a Innovation by ID'
        key :description, 'Returns a single innovation'
        key :operationId, :get_innovation_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Innovations']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Innovation to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'innovation response'
          schema do
            key :'$ref', :InnovationOutput
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
        key :summary, 'Update Innovation by ID'
        key :description, 'Returns the updated Innovation'
        key :operationId, :update_innovation
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Innovations']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Innovation to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :innovation do
          key :in, :body
          key :description, 'innovation to update'
          key :required, true
          schema do
            key :'$ref', :InnovationInputPut
          end
        end

        response 200 do
          key :description, 'innovation response'
          schema do
            key :'$ref', :InnovationOutput
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
        key :summary, 'Activate or deactivate a Innovation by ID'
        key :description, 'Returns the activated/deactivated Innovation'
        key :operationId, :change_active_innovation
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Innovations']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Innovation to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :innovation do
          key :in, :body
          key :description, 'Innovation to activate or deactivate'
          key :required, true
          schema do
            property :innovation do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'innovation response'
          schema do
            key :'$ref', :InnovationOutput
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

    swagger_path '/research_units/{research_group_id}/innovations' do
      operation :get do
        key :summary, 'Get all Innovations'
        key :description, 'Returns all Innovations'
        key :operationId, :get_innovations
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Innovations']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :product_type_id do
          key :in, :query
          key :description, 'ID of type to fetch'
          key :required, false
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'innovation response'
          schema do
            key :type, :array
            items do
              key :'$ref', :InnovationDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Innovations'
        key :description, 'Returns the created Innovation'
        key :operationId, :create_innovation
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Innovations']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :innovation do
          key :in, :body
          key :description, 'Innovation to register'
          key :required, true
          schema do
            key :'$ref', :InnovationInputPost
          end
        end

        response 201 do
          key :description, 'innovation response'
          schema do
            key :'$ref', :InnovationOutput
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