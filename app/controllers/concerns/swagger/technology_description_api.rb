module Swagger::TechnologyDescriptionApi
    extend ActiveSupport::Concern
    include Swagger::Blocks
  
    included do
      swagger_path '/technology_descriptions/{id}' do
        operation :get do
          key :summary, 'Get a Technology description by ID'
          key :description, 'Returns a single Technology description'
          key :operationId, :get_technology_description_by_id
          key :produces, ['application/json',]
          key :tags, ['TechnologyDescriptions']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of Technology Description to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          response 200 do
            key :description, 'Technology description response'
            schema do
              key :'$ref', :TechnologyDescriptionOutput
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
          key :summary, 'Update Technology description by ID'
          key :description, 'Returns the updated Technology description'
          key :operationId, :update_technology_description
          key :produces, ['application/json',]
          key :tags, ['TechnologyDescriptions']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of TechnologyDescription to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          parameter name: :technology_description do
            key :in, :body
            key :description, 'Technology description to update'
            key :required, true
            schema do
              key :'$ref', :TechnologyDescriptionInputPut
            end
          end
  
          response 200 do
            key :description, 'Technology description response'
            schema do
              key :'$ref', :TechnologyDescriptionOutput
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
  
      swagger_path '/procedure_requests/{procedure_request_id}/technology_descriptions' do
        operation :get do
          key :summary, 'Get all TechnologyDescriptions'
          key :description, 'Returns all Technology descriptions'
          key :operationId, :get_technology_descriptions
          key :produces, ['application/json',]
          key :tags, ['TechnologyDescriptions']
  
          parameter name: :procedure_request_id do
            key :in, :path
            key :description, 'ID of procedure request to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          response 200 do
            key :description, 'technology description response'
            schema do
              key :type, :array
              items do
                key :'$ref', :TechnologyDescriptionOutput
              end
            end
          end
          response :default do
            key :description, 'Unexpected Error'
          end
        end
  
        operation :post do
          key :summary, 'Create a new Technology description'
          key :description, 'Returns the created Technology description'
          key :operationId, :create_technology_description
          key :produces, ['application/json',]
          key :tags, ['TechnologyDescriptions']
  
          parameter name: :procedure_request_id do
            key :in, :path
            key :description, 'ID of procedure request to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          parameter name: :technology_description do
            key :in, :body
            key :description, 'Technology description to register'
            key :required, true
            schema do
              key :'$ref', :TechnologyDescriptionInputPost
            end
          end
  
          response 201 do
            key :description, 'Technology description response'
            schema do
              key :'$ref', :TechnologyDescriptionOutput
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

      swagger_path '/technology_descriptions/{id}/active' do
        operation :put do
          key :summary, 'Activate or deactivate a Technology description by ID'
          key :description, 'Returns the activated/deactivated Technology description by id'
          key :operationId, :change_active_procedure
          key :produces, ['application/json',]
          key :tags, ['TechnologyDescriptions']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of Technology description to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          parameter name: :technology_description do
            key :in, :body
            key :description, 'Technology description to update'
            key :required, true
            schema do
              property :technology_description do
                key :'$ref', :ChangeActive
              end
            end
          end
  
          response 200 do
            key :description, 'Technology description response'
            schema do
              key :'$ref', :TechnologyDescriptionOutput
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