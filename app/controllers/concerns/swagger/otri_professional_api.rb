module Swagger::OtriProfessionalApi
    extend ActiveSupport::Concern
    include Swagger::Blocks
  
    included do
      swagger_path '/otri_professionals/{id}' do
        operation :get do
          key :summary, 'Get a Otri_professional by ID'
          key :description, 'Returns a single otri professional'
          key :operationId, :get_otri_professional_by_id
          key :produces, ['application/json',]
          key :tags, ['OtriProfessionals']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of otri professional to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          response 200 do
            key :description, 'otri professional response'
            schema do
              key :'$ref', :OtriProfessionalOutput
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
          key :summary, 'Update Otri_professional by ID'
          key :description, 'Returns the updated Otri professional'
          key :operationId, :update_otri_professional
          key :produces, ['application/json',]
          key :tags, ['OtriProfessionals']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of Otri professional to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          parameter name: :otri_professional do
            key :in, :body
            key :description, 'Otri professional to update'
            key :required, true
            schema do
              key :'$ref', :OtriProfessionalInputPut
            end
          end
  
          response 200 do
            key :description, 'otri professional response'
            schema do
              key :'$ref', :OtriProfessionalOutput
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
  
      swagger_path '/otri_professionals/' do
        operation :get do
          key :summary, 'Get all Otri_professionals'
          key :description, 'Returns all otri professionals'
          key :operationId, :get_otri_professionals
          key :produces, ['application/json',]
          key :tags, ['OtriProfessionals']
  
          response 200 do
            key :description, 'otri professional response'
            schema do
              key :type, :array
              items do
                key :'$ref', :OtriProfessionalOutput
              end
            end
          end
          response :default do
            key :description, 'Unexpected Error'
          end
        end
        operation :post do
          key :summary, 'Create a new Otri_professional'
          key :description, 'Returns the created otri professional'
          key :operationId, :create_otri_professional
          key :produces, ['application/json',]
          key :tags, ['OtriProfessionals']
  
          parameter name: :otri_professional do
            key :in, :body
            key :description, 'Otri professional to register'
            key :required, true
            schema do
              key :'$ref', :OtriProfessionalInputPost
            end
          end
  
          response 201 do
            key :description, 'otri professional response'
            schema do
              key :'$ref', :OtriProfessionalOutput
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

      swagger_path '/otri_professionals/{id}/active' do
        operation :put do
          key :summary, 'Activate or deactivate a Otri_professional by ID'
          key :description, 'Returns the activated/deactivated otri professional by id'
          key :operationId, :change_active_otri_professional
          key :produces, ['application/json',]
          key :tags, ['OtriProfessionals']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of Otri professional to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          parameter name: :otri_professional do
            key :in, :body
            key :description, 'Otri professional to update'
            key :required, true
            schema do
              property :otri_professional do
                key :'$ref', :ChangeActive
              end
            end
          end
  
          response 200 do
            key :description, 'otri professional response'
            schema do
              key :'$ref', :OtriProfessionalOutput
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