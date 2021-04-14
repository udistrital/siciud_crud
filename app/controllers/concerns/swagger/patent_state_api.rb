module Swagger::PatentStateApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/patent_states/{id}' do
      operation :get do
        key :summary, 'Get Patent State by ID'
        key :description, 'Returns a single Patent State'
        key :operationId, :get_patent_state_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Patent States']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of patent state to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'patent state response'
          schema do
            key :'$ref', :PatentStateOutput
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
        key :summary, 'Update Patent State by ID'
        key :description, 'Returns the updated patent state'
        key :operationId, :update_patent_state
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Patent States']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of patent state to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end
        parameter name: :patent_state do
          key :in, :body
          key :description, 'Patent State to update'
          key :required, true
          schema do
            key :'$ref', :PatentStateInput
          end
        end

        response 200 do
          key :description, 'patent state response'
          schema do
            key :'$ref', :PatentStateOutput
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

    swagger_path '/patent_states/' do
      operation :get do
        key :summary, 'Get all Patent States'
        key :description, 'Returns all patent states'
        key :operationId, :get_patent_states
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Patent States']

        response 200 do
          key :description, 'patent state response'
          schema do
            key :type, :array
            items do
              key :'$ref', :PatentStateOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Patent State'
        key :description, 'Returns the created patent state'
        key :operationId, :create_patent_state
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Patent States']

        parameter name: :patent_state do
          key :in, :body
          key :description, 'Category to register'
          key :required, true
          schema do
            key :'$ref', :PatentStateInput
          end
        end

        response 201 do
          key :description, 'patent state response'
          schema do
            key :'$ref', :PatentStateOutput
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