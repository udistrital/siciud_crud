module Swagger::UserRoleApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/user_roles/{id}' do
      operation :get do
        key :summary, 'Get a User Role by ID'
        key :description, 'Returns a single user role'
        key :operationId, :get_user_role_by_id
        key :produces, ['application/json',]
        key :tags, ['User Roles']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of user role to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'user role response'
          schema do
            key :'$ref', :UserRoleOutput
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
        key :summary, 'Update User Role by ID'
        key :description, 'Returns the updated user role'
        key :operationId, :update_user_role
        key :produces, ['application/json',]
        key :tags, ['User Roles']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of user role to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :user_role do
          key :in, :body
          key :description, 'User Role to update'
          key :required, true
          schema do
            key :'$ref', :UserRoleInputPut
          end
        end

        response 200 do
          key :description, 'user role response'
          schema do
            key :'$ref', :UserRoleOutput
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

    swagger_path '/user_roles' do
      operation :get do
        key :summary, 'Get all User Roles'
        key :description, 'Returns all user roles'
        key :operationId, :get_user_roles
        key :produces, ['application/json',]
        key :tags, ['User Roles']

        parameter name: :per_page do
          key :in, :query
          key :description, 'number of records per page'
          key :required, false
          key :type, :integer
          key :format, :int64
        end

        parameter name: :page do
          key :in, :query
          key :description, 'page number'
          key :required, false
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'user role response'
          schema do
            key :type, :array
            items do
              key :'$ref', :UserRoleOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new User Role'
        key :description, 'Returns the created user role'
        key :operationId, :create_user_role
        key :produces, ['application/json',]
        key :tags, ['User Roles']

        parameter name: :user_role do
          key :in, :body
          key :description, 'User Role to register'
          key :required, true
          schema do
            key :'$ref', :UserRoleInputPost
          end
        end

        response 201 do
          key :description, 'user role response'
          schema do
            key :'$ref', :UserRoleOutput
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

    swagger_path '/user_roles/{:id}/active' do
      operation :put do
        key :summary, 'Activate or Deactivate a User Role by ID'
        key :description, 'Returns the user role activated or deactivated'
        key :operationId, :active_user_role
        key :produces, ['application/json',]
        key :tags, ['User Roles']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of user role to activate/deactivate'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :user_role do
          key :in, :body
          key :description, 'User Role to update'
          key :required, true
          schema do
            key :'$ref', :UserRoleInputActive
          end
        end

        response 200 do
          key :description, 'user role response'
          schema do
            key :'$ref', :UserRoleOutput
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