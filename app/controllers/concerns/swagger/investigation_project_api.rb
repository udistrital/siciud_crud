
module Swagger::InvestigationProjectApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/investigation_projects/{id}' do
      operation :get do
        key :summary, 'Get a Investigation Projects by ID'
        key :description, 'Returns a single investigation project'
        key :operationId, :get_investigation_project_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::CTIHRT::Investigation Projects']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of investigation project to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'investigation project response'
          schema do
            key :'$ref', :InvestigationProjectOutput
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
        key :summary, 'Update Investigation Projects by ID'
        key :description, 'Returns the updated investigation project'
        key :operationId, :update_investigation_project
        key :produces, ['application/json',]
        key :tags, ['Products::CTIHRT::Investigation Projects']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of investigation project to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :investigation_project do
          key :in, :body
          key :description, 'Investigation Projects to update'
          key :required, true
          schema do
            key :'$ref', :InvestigationProjectInputPut
          end
        end

        response 200 do
          key :description, 'investigation project response'
          schema do
            key :'$ref', :InvestigationProjectOutput
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
        key :summary, 'Activate or deactivate a Investigation Projects by ID'
        key :description, 'Returns the activated/deactivated investigation project'
        key :operationId, :change_active_investigation_project
        key :produces, ['application/json',]
        key :tags, ['Products::CTIHRT::Investigation Projects']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of investigation project to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :investigation_project do
          key :in, :body
          key :description, 'Investigation Projects to activate or deactivate'
          key :required, true
          schema do
            property :investigation_project do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'investigation project response'
          schema do
            key :'$ref', :InvestigationProjectOutput
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

    swagger_path '/research_units/{research_group_id}/investigation_projects' do
      operation :get do
        key :summary, 'Get all Investigation Projects'
        key :description, 'Returns all investigation projects'
        key :operationId, :get_investigation_projects
        key :produces, ['application/json',]
        key :tags, ['Products::CTIHRT::Investigation Projects']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :product_type_id do
          key :in, :query
          key :description, 'ID of type to fetch'
          key :required, false
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'investigation project response'
          schema do
            key :type, :array
            items do
              key :'$ref', :InvestigationProjectDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Investigation Projects'
        key :description, 'Returns the created investigation project'
        key :operationId, :create_investigation_project
        key :produces, ['application/json',]
        key :tags, ['Products::CTIHRT::Investigation Projects']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :investigation_project do
          key :in, :body
          key :description, 'Investigation Projects to register'
          key :required, true
          schema do
            key :'$ref', :InvestigationProjectInputPost
          end
        end

        response 201 do
          key :description, 'investigation project response'
          schema do
            key :'$ref', :InvestigationProjectOutput
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