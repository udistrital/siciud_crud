module Swagger::RoleApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/role/{id}' do
      operation :get do
        key :summary, 'Get a Role by ID'
        key :description, 'Returns a single role'
        key :operationId, :get_role_by_id
        key :produces, ['application/json',]
        key :tags, ['Roles']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of role to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'role response'
          schema do
            key :'$ref', :RoleOutput
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
      #   key :summary, 'Update Role by ID'
      #   key :description, 'Returns the updated role'
      #   key :operationId, :update_role
      #   key :produces, ['application/json',]
      #   key :tags, ['Roles']
      #
      #   parameter name: :id do
      #     key :in, :path
      #     key :description, 'ID of role to fetch'
      #     key :required, true
      #     key :type, :integer
      #     key :format, :int64
      #   end
      #
      #   parameter name: :role do
      #     key :in, :body
      #     key :description, 'Role to update'
      #     key :required, true
      #     schema do
      #       key :'$ref', :RoleInput
      #     end
      #   end
      #
      #   response 200 do
      #     key :description, 'role response'
      #     schema do
      #       key :'$ref', :RoleOutput
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

    swagger_path '/role' do
      operation :get do
        key :summary, 'Get all Roles'
        key :description, 'Returns all roles'
        key :operationId, :get_roles
        key :produces, ['application/json',]
        key :tags, ['Roles']

        response 200 do
          key :description, 'role response'
          schema do
            key :type, :array
            items do
              key :'$ref', :RoleOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      # operation :post do
      #   key :summary, 'Create a new Role'
      #   key :description, 'Returns the created role'
      #   key :operationId, :create_role
      #   key :produces, ['application/json',]
      #   key :tags, ['Roles']
      #
      #   parameter name: :role do
      #     key :in, :body
      #     key :description, 'Role to register'
      #     key :required, true
      #     schema do
      #       key :'$ref', :RoleInput
      #     end
      #   end
      #
      #   response 201 do
      #     key :description, 'role response'
      #     schema do
      #       key :'$ref', :RoleOutput
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