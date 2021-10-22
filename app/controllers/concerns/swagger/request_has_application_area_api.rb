module Swagger::RequestHasApplicationAreaApi
    extend ActiveSupport::Concern
    include Swagger::Blocks
  
    included do

      swagger_path '/procedure_requests/{procedure_request_id}/request_has_application_areas/' do
        operation :get do
          key :summary, 'Get all request_has_application_areas of one procedure request'
          key :description, 'Returns all request has application areas of one procedure request'
          key :operationId, :get_request_has_application_areas
          key :produces, ['application/json',]
          key :tags, ['RequestHasApplicationAreas']
            
          parameter name: :procedure_request_id do
            key :in, :path
            key :description, 'ID of procedure request to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end

          response 200 do
            key :description, 'request has application areas response'
            schema do
              key :type, :array
              items do
                key :'$ref', :RequestHasApplicationAreaOutput
              end
            end
          end
          response :default do
            key :description, 'Unexpected Error'
          end
        end

        operation :post do
          key :summary, 'Create a new request_has_application_area'
          key :description, 'Returns the created request has application area'
          key :operationId, :create_request_has_application_area
          key :produces, ['application/json',]
          key :tags, ['RequestHasApplicationAreas']
            
          parameter name: :procedure_request_id do
            key :in, :path
            key :description, 'ID of procedure request to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          
          parameter name: :request_has_application_area do
            key :in, :body
            key :description, 'RequestHasApplicationArea to register'
            key :required, true
            schema do
              key :'$ref', :RequestHasApplicationAreaInputPost
            end
          end
  
          response 201 do
            key :description, 'request has application area response'
            schema do
              key :'$ref', :RequestHasApplicationAreaOutput
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

      swagger_path '/request_has_application_areas/{id}/active' do
        operation :put do
          key :summary, 'Activate or deactivate a request_has_application_area by ID'
          key :description, 'Returns the activated/deactivated request has application area by id'
          key :operationId, :change_active_request_has_application_area
          key :produces, ['application/json',]
          key :tags, ['RequestHasApplicationAreas']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of request has application areas to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          parameter name: :request_has_application_area do
            key :in, :body
            key :description, 'request has application area to update'
            key :required, true
            schema do
              property :request_has_application_area do
                key :'$ref', :ChangeActive
              end
            end
          end
  
          response 200 do
            key :description, 'request has application area response'
            schema do
              key :'$ref', :RequestHasApplicationAreaOutput
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