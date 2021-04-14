module Swagger::WorkTypeApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/work_types/{id}' do
      operation :get do
        key :summary, 'Get work type by ID'
        key :description, 'Returns a single work type'
        key :operationId, :get_work_type_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Work Types']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of work type to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'work type response'
          schema do
            key :'$ref', :WorkTypeOutput
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
        key :summary, 'Update work type by ID'
        key :description, 'Returns the updated work type'
        key :operationId, :update_work_type
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Work Types']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of work type to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end
        parameter name: :work_type do
          key :in, :body
          key :description, 'Work Type to update'
          key :required, true
          schema do
            key :'$ref', :WorkTypeInput
          end
        end

        response 200 do
          key :description, 'work type response'
          schema do
            key :'$ref', :WorkTypeOutput
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

    swagger_path '/work_types/' do
      operation :get do
        key :summary, 'Get all Work Types'
        key :description, 'Returns all work types'
        key :operationId, :get_work_types
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Work Types']

        response 200 do
          key :description, 'work type response'
          schema do
            key :type, :array
            items do
              key :'$ref', :WorkTypeOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Work Type'
        key :description, 'Returns the created Work Type'
        key :operationId, :create_work_type
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Work Types']

        parameter name: :WorkType do
          key :in, :body
          key :description, 'Work Type to register'
          key :required, true
          schema do
            key :'$ref', :WorkTypeInput
          end
        end

        response 201 do
          key :description, 'work type response'
          schema do
            key :'$ref', :WorkTypeOutput
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