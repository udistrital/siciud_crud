module Swagger::ExtensionProjectApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/extension_projects/{id}' do
      operation :get do
        key :summary, 'Get a Extension Project by ID'
        key :description, 'Returns a single extension project'
        key :operationId, :get_extension_project_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::CTIHRT::Extension Projects']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of extension project to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'extension project response'
          schema do
            key :'$ref', :ExtensionProjectOutput
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
        key :summary, 'Update Extension Project by ID'
        key :description, 'Returns the updated extension project'
        key :operationId, :update_extension_project
        key :produces, ['application/json',]
        key :tags, ['Products::CTIHRT::Extension Projects']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of extension project to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :extension_project do
          key :in, :body
          key :description, 'Extension Project to update'
          key :required, true
          schema do
            key :'$ref', :ExtensionProjectInputPut
          end
        end

        response 200 do
          key :description, 'extension project response'
          schema do
            key :'$ref', :ExtensionProjectOutput
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

      operation :patch do
        key :summary, 'Activate or deactivate a Extension Project by ID'
        key :description, 'Returns the activated/deactivated extension project'
        key :operationId, :change_active_extension_project
        key :produces, ['application/json',]
        key :tags, ['Products::CTIHRT::Extension Projects']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of extension project to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :extension_project do
          key :in, :body
          key :description, 'Extension Project to activate or deactivate'
          key :required, true
          schema do
            property :extension_project do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'extension project response'
          schema do
            key :'$ref', :ExtensionProjectOutput
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

    swagger_path '/research_units/{research_group_id}/extension_projects' do
      operation :get do
        key :summary, 'Get all Extension Projects'
        key :description, 'Returns all Extension Projects'
        key :operationId, :get_extension_projects
        key :produces, ['application/json',]
        key :tags, ['Products::CTIHRT::Extension Projects']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'extension project response'
          schema do
            key :type, :array
            items do
              key :'$ref', :ExtensionProjectDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Extension Projects'
        key :description, 'Returns the created extension project'
        key :operationId, :create_extension_project
        key :produces, ['application/json',]
        key :tags, ['Products::CTIHRT::Extension Projects']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :extension_project do
          key :in, :body
          key :description, 'Extension Project to register'
          key :required, true
          schema do
            key :'$ref', :ExtensionProjectInputPost
          end
        end

        response 201 do
          key :description, 'extension project response'
          schema do
            key :'$ref', :ExtensionProjectOutput
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