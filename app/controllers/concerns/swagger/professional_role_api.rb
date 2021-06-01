module Swagger::ProfessionalRoleApi
    extend ActiveSupport::Concern
    include Swagger::Blocks
  
    included do
      swagger_path '/professional_roles/{id}' do
        operation :get do
          key :summary, 'Get a Professional_role by ID'
          key :description, 'Returns a single professional role'
          key :operationId, :get_professional_role_by_id
          key :produces, ['application/json',]
          key :tags, ['ProfessionalRoles']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of profesional role to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          response 200 do
            key :description, 'profesional role response'
            schema do
              key :'$ref', :ProfessionalRoleOutput
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
          key :summary, 'Update Professional_role by ID'
          key :description, 'Returns the updated Professional role'
          key :operationId, :update_professional_role
          key :produces, ['application/json',]
          key :tags, ['ProfessionalRoles']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of Professional role to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          parameter name: :professional_role do
            key :in, :body
            key :description, 'Professional role to update'
            key :required, true
            schema do
              key :'$ref', :ProfessionalRoleInputPut
            end
          end
  
          response 200 do
            key :description, 'professional role response'
            schema do
              key :'$ref', :ProfessionalRoleOutput
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
  
      swagger_path '/professional_roles/' do
        operation :get do
          key :summary, 'Get all Professional_roles'
          key :description, 'Returns all professional roles'
          key :operationId, :get_professional_roles
          key :produces, ['application/json',]
          key :tags, ['ProfessionalRoles']
  
          response 200 do
            key :description, 'professional role response'
            schema do
              key :type, :array
              items do
                key :'$ref', :ProfessionalRoleOutput
              end
            end
          end
          response :default do
            key :description, 'Unexpected Error'
          end
        end
        operation :post do
          key :summary, 'Create a new Professional_role'
          key :description, 'Returns the created Professional role'
          key :operationId, :create_professional_role
          key :produces, ['application/json',]
          key :tags, ['ProfessionalRoles']
  
          parameter name: :professional_role do
            key :in, :body
            key :description, 'Professional role to register'
            key :required, true
            schema do
              key :'$ref', :ProfessionalRoleInputPost
            end
          end
  
          response 201 do
            key :description, 'professional role response'
            schema do
              key :'$ref', :ProfessionalRoleOutput
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