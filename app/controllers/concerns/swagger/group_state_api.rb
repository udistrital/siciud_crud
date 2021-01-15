module Swagger::GroupStateApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/api/v1/group_states/{id}' do
      operation :get do
        key :summary, 'Get a Group State by ID'
        key :description, 'Returns a single group state'
        key :operationId, :get_group_state_by_id
        key :produces, ['application/json',]
        key :tags, ['Research Units:: Group States']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of group state to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'group state response'
          schema do
            key :'$ref', :GroupStateOutput
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

      # operation :put do
      #   key :summary, 'Update Group State by ID'
      #   key :description, 'Returns the updated group state'
      #   key :operationId, :update_group_state
      #   key :produces, ['application/json',]
      #   key :tags, ['Research Units:: Group States']
      #
      #   parameter name: :id do
      #     key :in, :path
      #     key :description, 'ID of group state to fetch'
      #     key :required, true
      #     key :type, :integer
      #     key :format, :int64
      #   end
      #
      #   parameter name: :group_state do
      #     key :in, :body
      #     key :description, 'Group State to update'
      #     key :required, true
      #     schema do
      #       key :'$ref', :GroupStateInput
      #     end
      #   end
      #
      #   response 200 do
      #     key :description, 'group state response'
      #     schema do
      #       key :'$ref', :GroupStateOutput
      #     end
      #   end
      #   response 422 do
      #     key :description, 'Unprocessable Entity'
      #     schema do
      #       key :'$ref', :ErrorUnprocessableEntity
      #     end
      #   end
      #   response :default do
      #     key :description, 'Unexpected Error'
      #   end
      # end
    end

    swagger_path '/api/v1/group_states/' do
      operation :get do
        key :summary, 'Get all Group States'
        key :description, 'Returns all group states'
        key :operationId, :get_gm_states
        key :produces, ['application/json',]
        key :tags, ['Research Units:: Group States']

        response 200 do
          key :description, 'group state response'
          schema do
            key :type, :array
            items do
              key :'$ref', :GroupStateOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      # operation :post do
      #   key :summary, 'Create a new Group State'
      #   key :description, 'Returns the created group state'
      #   key :operationId, :create_group_state
      #   key :produces, ['application/json',]
      #   key :tags, ['Research Units:: Group States']
      #
      #   parameter name: :group_state do
      #     key :in, :body
      #     key :description, 'Group State to register'
      #     key :required, true
      #     schema do
      #       key :'$ref', :GroupStateInput
      #     end
      #   end
      #
      #   response 201 do
      #     key :description, 'group state response'
      #     schema do
      #       key :'$ref', :GroupStateOutput
      #     end
      #   end
      #   response 422 do
      #     key :description, 'Unprocessable Entity'
      #     schema do
      #       key :'$ref', :ErrorUnprocessableEntity
      #     end
      #   end
      #   response :default do
      #     key :description, 'Unexpected Error'
      #   end
      # end
    end
  end
end