module Swagger::ResearchCreationWorkApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/research_group/{research_group_id}/research_creation_works/{id}' do
      operation :get do
        key :summary, 'Get a Research Creation Works of a Research Unit by ID'
        key :description, 'Returns a single research creation works'
        key :operationId, :get_research_creation_work_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Research Creation Works']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of research creation work of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'research creation work response'
          schema do
            key :'$ref', :ResearchCreationWorkOutput
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
        key :summary, 'Update Research Creation Work by ID'
        key :description, 'Returns the updated research creation work of a research unit'
        key :operationId, :update_research_creation_work
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Research Creation Works']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of research creation work of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :research_creation_work do
          key :in, :body
          key :description, 'Research Creation Work to update'
          key :required, true
          schema do
            key :'$ref', :ResearchCreationWorkInput
          end
        end

        response 200 do
          key :description, 'research creation work response'
          schema do
            key :'$ref', :ResearchCreationWorkOutput
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

    swagger_path '/research_group/{research_group_id}/research_creation_works/' do
      operation :get do
        key :summary, 'Get all Research Creation Works'
        key :description, 'Returns all research creation works'
        key :operationId, :get_research_creation_works
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Research Creation Works']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'research creation work response'
          schema do
            key :type, :array
            items do
              key :'$ref', :ResearchCreationWorkDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Research Creation Work'
        key :description, 'Returns the created research creation work'
        key :operationId, :create_research_creation_work
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Research Creation Works']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :ResearchCreationWork do
          key :in, :body
          key :description, 'Research Creation Work to register'
          key :required, true
          schema do
            key :'$ref', :ResearchCreationWorkInput
          end
        end

        response 201 do
          key :description, 'research creation work response'
          schema do
            key :'$ref', :ResearchCreationWorkOutput
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

    swagger_path '/research_units/{research_group_id}/research_creation_works/{id}/active' do
      operation :put do
        key :summary, 'Update Research Creation Work by ID'
        key :description, 'Returns the updated research creation work of a research unit'
        key :operationId, :change_active_research_creation_work
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Research Creation Works']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of research creation work of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :research_creation_work do
          key :in, :body
          key :description, 'Research Creation Work to update'
          key :required, true
          schema do
            property :research_creation_work do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'research creation work response'
          schema do
            key :'$ref', :ResearchCreationWorkOutput
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