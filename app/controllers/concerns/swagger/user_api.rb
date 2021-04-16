module Swagger::UserApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/users/{id}' do
      operation :get do
        key :summary, 'Get a User by ID'
        key :description, 'Returns a single user'
        key :operationId, :get_user_by_id
        key :produces, ['application/json',]
        key :tags, ['Users']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of user  to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'user response'
          schema do
            key :'$ref', :UserOutput
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
        key :summary, 'Update User by ID'
        key :description, 'Returns the updated user'
        key :operationId, :update_user
        key :produces, ['application/json',]
        key :tags, ['Users']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of User to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :user do
          key :in, :body
          key :description, 'User to update'
          key :required, true
          schema do
            key :'$ref', :UserInputPut
          end
        end

        response 200 do
          key :description, 'user response'
          schema do
            key :'$ref', :UserOutput
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

    swagger_path '/users/' do
      operation :get do
        key :summary, 'Get all Users'
        key :description, 'Returns all users'
        key :operationId, :get_users
        key :produces, ['application/json',]
        key :tags, ['Users']

        parameter name: :identification_number do
          key :in, :query
          key :description, 'user identification number'
          key :required, true
          key :type, :string
        end

        response 200 do
          key :description, 'user response'
          schema do
            key :type, :array
            items do
              key :'$ref', :UserDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new User'
        key :description, 'Returns the created user'
        key :operationId, :create_user
        key :produces, ['application/json',]
        key :tags, ['Users']

        parameter name: :user do
          key :in, :body
          key :description, 'User to register'
          key :required, true
          schema do
            key :'$ref', :UserInputPost
          end
        end

        response 201 do
          key :description, 'user response'
          schema do
            key :'$ref', :UserOutput
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

    swagger_path '/users/{id}/active' do
      operation :put do
        key :summary, 'Activate or Deactivate a User by ID'
        key :description, 'Returns the user activated or deactivated '
        key :operationId, :active_user
        key :produces, ['application/json',]
        key :tags, ['Users']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of User to activate/deactivate'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :user do
          key :in, :body
          key :description, 'User to update'
          key :required, true
          schema do
            key :'$ref', :UserInputActive
          end
        end

        response 200 do
          key :description, 'user response'
          schema do
            key :'$ref', :UserOutput
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