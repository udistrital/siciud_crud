module Swagger::GmStateApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/gm_states/{id}' do
      operation :get do
        key :summary, 'Get a State of Group Members by ID'
        key :description, 'Returns a single state of group member'
        key :operationId, :get_gm_state_by_id
        key :produces, ['application/json',]
        key :tags, ['Research Units::States of Group Members']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of state of group member to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'state of group member response'
          schema do
            key :'$ref', :GmStateOutput
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
      #   key :summary, 'Update State of Group Member by ID'
      #   key :description, 'Returns the updated state of group member'
      #   key :operationId, :update_gm_state
      #   key :produces, ['application/json',]
      #   key :tags, ['Research Units::States of Group Members']
      #
      #   parameter name: :id do
      #     key :in, :path
      #     key :description, 'ID of state of group member to fetch'
      #     key :required, true
      #     key :type, :integer
      #     key :format, :int64
      #   end
      #
      #   parameter name: :gm_state do
      #     key :in, :body
      #     key :description, 'State of Group Member to update'
      #     key :required, true
      #     schema do
      #       key :'$ref', :GmStateInput
      #     end
      #   end
      #
      #   response 200 do
      #     key :description, 'state of group member response'
      #     schema do
      #       key :'$ref', :GmStateOutput
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

    swagger_path '/gm_states' do
      operation :get do
        key :summary, 'Get all States of Group Members'
        key :description, 'Returns all states of group members'
        key :operationId, :get_gm_states
        key :produces, ['application/json',]
        key :tags, ['Research Units::States of Group Members']

        response 200 do
          key :description, 'state of group member response'
          schema do
            key :type, :array
            items do
              key :'$ref', :GmStateOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      # operation :post do
      #   key :summary, 'Create a new State of Group Member'
      #   key :description, 'Returns the created state of group member'
      #   key :operationId, :create_gm_state
      #   key :produces, ['application/json',]
      #   key :tags, ['Research Units::States of Group Members']
      #
      #   parameter name: :gm_state do
      #     key :in, :body
      #     key :description, 'State of Group Member to register'
      #     key :required, true
      #     schema do
      #       key :'$ref', :GmStateInput
      #     end
      #   end
      #
      #   response 201 do
      #     key :description, 'state of group member response'
      #     schema do
      #       key :'$ref', :GmStateOutput
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