module Swagger::ReadAttributeApi
    extend ActiveSupport::Concern
    include Swagger::Blocks
  
    included do
      swagger_path '/read_attributes/{id}' do
        operation :get do
          key :summary, 'Get a Read Attribute by ID'
          key :description, 'Returns a single Read Attribute'
          key :operationId, :get_read_attribute_by_id
          key :produces, ['application/json',]
          key :tags, ['ReadAttributes']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of ReadAttribute to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          response 200 do
            key :description, 'read attribute response'
            schema do
              key :'$ref', :ReadAttributeOutput
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
          key :summary, 'Update Read Attribute by ID'
          key :description, 'Returns the updated Read Attribute'
          key :operationId, :update_read_attribute
          key :produces, ['application/json',]
          key :tags, ['ReadAttributes']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of ReadAttribute to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          parameter name: :read_attribute do
            key :in, :body
            key :description, 'read attribute to update'
            key :required, true
            schema do
              key :'$ref', :ReadAttributeInputPut
            end
          end
  
          response 200 do
            key :description, 'read attribute response'
            schema do
              key :'$ref', :ReadAttributeOutput
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
  
      swagger_path '/task_models/{task_model_id}/read_attributes' do
        operation :get do
          key :summary, 'Get all ReadAttributes'
          key :description, 'Returns all Read Attributes'
          key :operationId, :get_read_attributes
          key :produces, ['application/json',]
          key :tags, ['ReadAttributes']
  
          parameter name: :task_model_id do
            key :in, :path
            key :description, 'ID of task model to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          response 200 do
            key :description, 'read attribute response'
            schema do
              key :type, :array
              items do
                key :'$ref', :ReadAttributeOutput
              end
            end
          end
          response :default do
            key :description, 'Unexpected Error'
          end
        end
  
        operation :post do
          key :summary, 'Create a new Read Attribute'
          key :description, 'Returns the created Read Attribute'
          key :operationId, :create_read_attribute
          key :produces, ['application/json',]
          key :tags, ['ReadAttributes']
  
          parameter name: :task_model_id do
            key :in, :path
            key :description, 'ID of task model to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          parameter name: :read_attribute do
            key :in, :body
            key :description, 'Read attribute to register'
            key :required, true
            schema do
              key :'$ref', :ReadAttributeInputPost
            end
          end
  
          response 201 do
            key :description, 'read attribute response'
            schema do
              key :'$ref', :ReadAttributeOutput
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