module Swagger::IdiInvestigationProjectApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/idi_investigation_projects/{id}' do
      operation :get do
        key :summary, 'Get a Idi Investigation Project by ID'
        key :description, 'Returns a single idi investigation project'
        key :operationId, :get_idi_investigation_project_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::CTIHRT::Idi Investigation Project']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of idi investigation project to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'idi investigation project response'
          schema do
            key :'$ref', :IdiInvestigationProjectOutput
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
        key :summary, 'Update Idi Investigation Project by ID'
        key :description, 'Returns the updated idi investigation project'
        key :operationId, :update_idi_investigation_project
        key :produces, ['application/json',]
        key :tags, ['Products::CTIHRT::Idi Investigation Project']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of idi investigation project to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :idi_investigation_project do
          key :in, :body
          key :description, 'Idi Investigation Project to update'
          key :required, true
          schema do
            key :'$ref', :IdiInvestigationProjectInputPut
          end
        end

        response 200 do
          key :description, 'idi investigation project response'
          schema do
            key :'$ref', :IdiInvestigationProjectOutput
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
        key :summary, 'Activate or deactivate a Idi Investigation Project by ID'
        key :description, 'Returns the activated/deactivated idi investigation project'
        key :operationId, :change_active_idi_investigation_project
        key :produces, ['application/json',]
        key :tags, ['Products::CTIHRT::Idi Investigation Project']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of idi investigation project to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :idi_investigation_project do
          key :in, :body
          key :description, 'Idi Investigation Project to activate or deactivate'
          key :required, true
          schema do
            property :idi_investigation_project do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'idi investigation project response'
          schema do
            key :'$ref', :IdiInvestigationProjectOutput
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

    swagger_path '/research_units/{research_group_id}/idi_investigation_projects' do
      operation :get do
        key :summary, 'Get all Idi Investigation Project'
        key :description, 'Returns all idi investigation projects'
        key :operationId, :get_idi_investigation_projects
        key :produces, ['application/json',]
        key :tags, ['Products::CTIHRT::Idi Investigation Project']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'idi investigation project response'
          schema do
            key :type, :array
            items do
              key :'$ref', :IdiInvestigationProjectDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Idi Investigation Project'
        key :description, 'Returns the created idi investigation project'
        key :operationId, :create_idi_investigation_project
        key :produces, ['application/json',]
        key :tags, ['Products::CTIHRT::Idi Investigation Project']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :idi_investigation_project do
          key :in, :body
          key :description, 'Idi Investigation Project to register'
          key :required, true
          schema do
            key :'$ref', :IdiInvestigationProjectInputPost
          end
        end

        response 201 do
          key :description, 'idi investigation project response'
          schema do
            key :'$ref', :IdiInvestigationProjectOutput
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