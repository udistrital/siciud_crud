module Swagger::CycleTypeApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/api/v1/cycle_types/{id}' do
      operation :get do
        key :summary, 'Get a Cycle Type by ID'
        key :description, 'Returns a single cycle type'
        key :operationId, :get_cycle_type_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::Cycle Types']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of cycle type to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'cycle type response'
          schema do
            key :'$ref', :CycleTypeOutput
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
        key :summary, 'Update Cycle Type by ID'
        key :description, 'Returns the updated cycle type'
        key :operationId, :update_cycle_type
        key :produces, ['application/json',]
        key :tags, ['Products::Cycle Types']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of cycle type to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :cycle_type do
          key :in, :body
          key :description, 'Cycle Type to update'
          key :required, true
          schema do
            key :'$ref', :CycleTypeInput
          end
        end

        response 200 do
          key :description, 'cycle type response'
          schema do
            key :'$ref', :CycleTypeOutput
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

    swagger_path '/api/v1/cycle_types/' do
      operation :get do
        key :summary, 'Get all Cycle Types'
        key :description, 'Returns all cycle types'
        key :operationId, :get_cycle_types
        key :produces, ['application/json',]
        key :tags, ['Products::Cycle Types']

        response 200 do
          key :description, 'cycle type response'
          schema do
            key :type, :array
            items do
              key :'$ref', :CycleTypeOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Cycle Type'
        key :description, 'Returns the created cycle type'
        key :operationId, :create_cycle_type
        key :produces, ['application/json',]
        key :tags, ['Products::Cycle Types']

        parameter name: :cycle_type do
          key :in, :body
          key :description, 'Cycle Type to register'
          key :required, true
          schema do
            key :'$ref', :CycleTypeInput
          end
        end

        response 201 do
          key :description, 'cycle type response'
          schema do
            key :'$ref', :CycleTypeOutput
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