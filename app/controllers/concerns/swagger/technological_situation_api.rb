module Swagger::TechnologicalSituationApi
    extend ActiveSupport::Concern
    include Swagger::Blocks
  
    included do
      swagger_path '/technological_situations/{id}' do
        operation :get do
          key :summary, 'Get a Technological situation by ID'
          key :description, 'Returns a single Technological situation'
          key :operationId, :get_technological_situation_by_id
          key :produces, ['application/json',]
          key :tags, ['TechnologicalSituations']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of Technological situation to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          response 200 do
            key :description, 'Technological situation response'
            schema do
              key :'$ref', :TechnologicalSituationOutput
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
          key :summary, 'Update Technological situation by ID'
          key :description, 'Returns the updated Technological situation'
          key :operationId, :update_technological_situation
          key :produces, ['application/json',]
          key :tags, ['TechnologicalSituations']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of TechnologicalSituation to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          parameter name: :technological_situation do
            key :in, :body
            key :description, 'Technological situation to update'
            key :required, true
            schema do
              key :'$ref', :TechnologicalSituationInputPut
            end
          end
  
          response 200 do
            key :description, 'Technological situation response'
            schema do
              key :'$ref', :TechnologicalSituationOutput
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
  
      swagger_path '/procedure_requests/{procedure_request_id}/technological_situations' do
        operation :get do
          key :summary, 'Get all TechnologicalSituations'
          key :description, 'Returns all Technological situations'
          key :operationId, :get_technological_situations
          key :produces, ['application/json',]
          key :tags, ['TechnologicalSituations']
  
          parameter name: :procedure_request_id do
            key :in, :path
            key :description, 'ID of procedure request to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          response 200 do
            key :description, 'Technological situation response'
            schema do
              key :type, :array
              items do
                key :'$ref', :TechnologicalSituationOutput
              end
            end
          end
          response :default do
            key :description, 'Unexpected Error'
          end
        end
  
        operation :post do
          key :summary, 'Create a new Technological situation'
          key :description, 'Returns the created Technological situation'
          key :operationId, :create_technological_situation
          key :produces, ['application/json',]
          key :tags, ['TechnologicalSituations']
  
          parameter name: :procedure_request_id do
            key :in, :path
            key :description, 'ID of procedure request to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          parameter name: :technological_situation do
            key :in, :body
            key :description, 'Technological situation to register'
            key :required, true
            schema do
              key :'$ref', :TechnologicalSituationInputPost
            end
          end
  
          response 201 do
            key :description, 'Technological situation response'
            schema do
              key :'$ref', :TechnologicalSituationOutput
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

      swagger_path '/technological_situations/{id}/active' do
        operation :put do
          key :summary, 'Activate or deactivate a Technological situation by ID'
          key :description, 'Returns the activated/deactivated Technological situation by id'
          key :operationId, :change_active_procedure
          key :produces, ['application/json',]
          key :tags, ['TechnologicalSituations']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of Technological situation to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          parameter name: :technological_situation do
            key :in, :body
            key :description, 'Technological situation to update'
            key :required, true
            schema do
              property :technological_situation do
                key :'$ref', :ChangeActive
              end
            end
          end
  
          response 200 do
            key :description, 'Technological situation response'
            schema do
              key :'$ref', :TechnologicalSituationOutput
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