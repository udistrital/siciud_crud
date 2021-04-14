module Swagger::PetitionStatusApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/petition_statuses/{id}' do
      operation :get do
        key :summary, 'Get Petition Status by ID'
        key :description, 'Returns a single petition status'
        key :operationId, :get_petition_status_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::Petition Statuses']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of petition status to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'petition status response'
          schema do
            key :'$ref', :PetitionStatusOutput
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
        key :summary, 'Update Petition Status by ID'
        key :description, 'Returns the updated petition status'
        key :operationId, :update_petition_status
        key :produces, ['application/json',]
        key :tags, ['Products::Petition Statuses']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of petition status to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end
        parameter name: :petition_status do
          key :in, :body
          key :description, 'Petition Status to update'
          key :required, true
          schema do
            key :'$ref', :PetitionStatusInput
          end
        end

        response 200 do
          key :description, 'petition status response'
          schema do
            key :'$ref', :PetitionStatusOutput
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

    swagger_path '/petition_statuses/' do
      operation :get do
        key :summary, 'Get all Petition Statuses'
        key :description, 'Returns all petition statuses'
        key :operationId, :get_petition_statuses
        key :produces, ['application/json',]
        key :tags, ['Products::Petition Statuses']

        parameter name: :product_type_id do
          key :in, :query
          key :description, 'filter by product type'
          key :required, false
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'petition status response'
          schema do
            key :type, :array
            items do
              key :'$ref', :PetitionStatusOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Petition Status'
        key :description, 'Returns the created petition status'
        key :operationId, :create_petition_status
        key :produces, ['application/json',]
        key :tags, ['Products::Petition Statuses']

        parameter name: :petition_status do
          key :in, :body
          key :description, 'Petition Status to register'
          key :required, true
          schema do
            key :'$ref', :PetitionStatusInput
          end
        end

        response 201 do
          key :description, 'petition status response'
          schema do
            key :'$ref', :PetitionStatusOutput
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