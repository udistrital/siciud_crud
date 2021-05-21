module Swagger::ResearcherApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/researchers/{id}' do
      operation :get do
        key :summary, 'Get a Researcher by ID'
        key :description, 'Returns a single researcher'
        key :operationId, :get_researcher_by_id
        key :produces, ['application/json',]
        key :tags, ['Researchers']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of researcher to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'researcher response'
          schema do
            key :'$ref', :ResearcherOutput
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
        key :summary, 'Update Researcher by ID'
        key :description, 'Returns the updated researcher'
        key :operationId, :update_researcher
        key :produces, ['application/json',]
        key :tags, ['Researchers']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Researcher to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :researcher do
          key :in, :body
          key :description, 'Researcher to update'
          key :required, true
          schema do
            key :'$ref', :ResearcherInputPut
          end
        end

        response 200 do
          key :description, 'researcher response'
          schema do
            key :'$ref', :ResearcherOutput
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

    swagger_path '/researchers' do
      operation :get do
        key :summary, 'Get all Researchers or search a researcher by the identification_number'
        key :description, 'Returns all researchers or search a researcher by the identification_number'
        key :operationId, :get_researchers
        key :produces, ['application/json',]
        key :tags, ['Researchers']

        parameter name: :identification_number do
          key :in, :query
          key :description, 'researcher identification number'
          key :required, false
          key :type, :string
        end

        response 200 do
          key :description, 'researcher response'
          schema do
            key :type, :array
            items do
              key :'$ref', :ResearcherOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Researcher'
        key :description, 'Returns the created researcher'
        key :operationId, :create_researcher
        key :produces, ['application/json',]
        key :tags, ['Researchers']

        parameter name: :researcher do
          key :in, :body
          key :description, 'Researcher to register'
          key :required, true
          schema do
            key :'$ref', :ResearcherInputPost
          end
        end

        response 201 do
          key :description, 'researcher response'
          schema do
            key :'$ref', :ResearcherOutput
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

    swagger_path '/researcher_research_units' do
      operation :get do
        key :summary, 'Search research units of an Investigator by identity document'
        key :description, 'Search research units of an Investigator by identity document'
        key :operationId, :get_researcher_research_units
        key :produces, ['application/json',]
        key :tags, ['Researchers']

        parameter name: :identification_number do
          key :in, :query
          key :description, 'researcher identification number'
          key :required, false
          key :type, :string
        end

        response 200 do
          key :description, 'researcher response'
          schema do
            key :type, :array
            items do
              key :'$ref', :ResearcherResearchUnitOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end
    end
  end
end