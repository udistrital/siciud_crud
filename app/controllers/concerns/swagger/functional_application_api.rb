module Swagger::FunctionalApplicationApi
    extend ActiveSupport::Concern
    include Swagger::Blocks
  
    included do
      swagger_path '/functional_applications/{id}' do
        operation :get do
          key :summary, 'Get a Functional application by ID'
          key :description, 'Returns a single Functional application'
          key :operationId, :get_functional_application_by_id
          key :produces, ['application/json',]
          key :tags, ['FunctionalApplications']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of Functional application to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          response 200 do
            key :description, 'Functional application response'
            schema do
              key :'$ref', :FunctionalApplicationOutput
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
          key :summary, 'Update Functional application by ID'
          key :description, 'Returns the updated Functional application'
          key :operationId, :update_functional_application
          key :produces, ['application/json',]
          key :tags, ['FunctionalApplications']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of FunctionalApplication to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          parameter name: :functional_application do
            key :in, :body
            key :description, 'Functional application to update'
            key :required, true
            schema do
              key :'$ref', :FunctionalApplicationInputPut
            end
          end
  
          response 200 do
            key :description, 'Functional application response'
            schema do
              key :'$ref', :FunctionalApplicationOutput
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
  
      swagger_path '/procedure_requests/{procedure_request_id}/functional_applications' do
        operation :get do
          key :summary, 'Get all FunctionalApplications'
          key :description, 'Returns all Functional applications'
          key :operationId, :get_functional_applications
          key :produces, ['application/json',]
          key :tags, ['FunctionalApplications']
  
          parameter name: :procedure_request_id do
            key :in, :path
            key :description, 'ID of procedure request to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          response 200 do
            key :description, 'Functional application response'
            schema do
              key :type, :array
              items do
                key :'$ref', :FunctionalApplicationOutput
              end
            end
          end
          response :default do
            key :description, 'Unexpected Error'
          end
        end
  
        operation :post do
          key :summary, 'Create a new Functional application'
          key :description, 'Returns the created Functional application'
          key :operationId, :create_functional_application
          key :produces, ['application/json',]
          key :tags, ['FunctionalApplications']
  
          parameter name: :procedure_request_id do
            key :in, :path
            key :description, 'ID of procedure request to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          parameter name: :functional_application do
            key :in, :body
            key :description, 'Functional application to register'
            key :required, true
            schema do
              key :'$ref', :FunctionalApplicationInputPost
            end
          end
  
          response 201 do
            key :description, 'Functional application response'
            schema do
              key :'$ref', :FunctionalApplicationOutput
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

      swagger_path '/functional_applications/{id}/active' do
        operation :put do
          key :summary, 'Activate or deactivate a Functional application by ID'
          key :description, 'Returns the activated/deactivated Functional application by id'
          key :operationId, :change_active_procedure
          key :produces, ['application/json',]
          key :tags, ['FunctionalApplications']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of Functional application to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          parameter name: :functional_application do
            key :in, :body
            key :description, 'Functional application to update'
            key :required, true
            schema do
              property :functional_application do
                key :'$ref', :ChangeActive
              end
            end
          end
  
          response 200 do
            key :description, 'Functional application response'
            schema do
              key :'$ref', :FunctionalApplicationOutput
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