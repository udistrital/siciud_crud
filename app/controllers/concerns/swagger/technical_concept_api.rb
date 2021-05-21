module Swagger::TechnicalConceptApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/technical_concepts/{id}' do
      operation :get do
        key :summary, 'Get a Technical Concept by ID'
        key :description, 'Returns a single technical concept'
        key :operationId, :get_technical_concept_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Technical Concepts']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of technical concept to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'technical concept response'
          schema do
            key :'$ref', :TechnicalConceptOutput
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
        key :summary, 'Update Technical Concept by ID'
        key :description, 'Returns the updated technical concept'
        key :operationId, :update_technical_concept
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Technical Concepts']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of technical concept to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :technical_concept do
          key :in, :body
          key :description, 'Technical Concept to update'
          key :required, true
          schema do
            key :'$ref', :TechnicalConceptInputPut
          end
        end

        response 200 do
          key :description, 'technical concept response'
          schema do
            key :'$ref', :TechnicalConceptOutput
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
        key :summary, 'Activate or deactivate a Technical Concept by ID'
        key :description, 'Returns the activated/deactivated technical concept'
        key :operationId, :change_active_technical_concept
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Technical Concepts']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of technical concept to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :technical_concept do
          key :in, :body
          key :description, 'Technical Concept to activate or deactivate'
          key :required, true
          schema do
            property :technical_concept do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'technical concept response'
          schema do
            key :'$ref', :TechnicalConceptOutput
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

    swagger_path '/research_units/{research_group_id}/technical_concepts' do
      operation :get do
        key :summary, 'Get all Technical Concepts'
        key :description, 'Returns all technical concepts'
        key :operationId, :get_technical_concepts
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Technical Concepts']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'technical concept response'
          schema do
            key :type, :array
            items do
              key :'$ref', :TechnicalConceptDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Technical Concepts'
        key :description, 'Returns the created technical concept'
        key :operationId, :create_technical_concept
        key :produces, ['application/json',]
        key :tags, ['Products::TDI::Technical Concepts']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :technical_concept do
          key :in, :body
          key :description, 'Technical Concept to register'
          key :required, true
          schema do
            key :'$ref', :TechnicalConceptInputPost
          end
        end

        response 201 do
          key :description, 'technical concept response'
          schema do
            key :'$ref', :TechnicalConceptOutput
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