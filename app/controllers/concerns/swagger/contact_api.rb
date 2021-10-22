module Swagger::ContactApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/contacts/{id}' do
      operation :get do
        key :summary, 'Get a Contact by ID'
        key :description, 'Returns a single contact'
        key :operationId, :get_contact_by_id
        key :produces, ['application/json',]
        key :tags, ['Contacts']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of contact to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'contact response'
          schema do
            key :'$ref', :ContactOutput
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
        key :summary, 'Update Contact by ID'
        key :description, 'Returns the updated contact'
        key :operationId, :update_contact
        key :produces, ['application/json',]
        key :tags, ['Contacts']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of contact to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :contact do
          key :in, :body
          key :description, 'Contact to update'
          key :required, true
          schema do
            key :'$ref', :ContactInputPut
          end
        end

        response 200 do
          key :description, 'contact response'
          schema do
            key :'$ref', :ContactOutput
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
        key :summary, 'Activate or deactivate a Contact by ID'
        key :description, 'Returns the activated/deactivated contact'
        key :operationId, :change_active_contact
        key :produces, ['application/json',]
        key :tags, ['Contacts']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of contact to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :contact do
          key :in, :body
          key :description, 'Contact to activate or deactivate'
          key :required, true
          schema do
            property :contact do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'contact response'
          schema do
            key :'$ref', :ContactOutput
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

    swagger_path '/contacts' do
      operation :get do
        key :summary, 'Get all Contacts'
        key :description, 'Returns all contacts'
        key :operationId, :get_contacts
        key :produces, ['application/json',]
        key :tags, ['Contacts']

        parameter name: :identification_number do
          key :in, :query
          key :description, 'identification number'
          key :required, false
          key :type, :string
        end

        response 200 do
          key :description, 'contact response'
          schema do
            key :type, :array
            items do
              key :'$ref', :ContactDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Contact'
        key :description, 'Returns the created contact'
        key :operationId, :create_contact
        key :produces, ['application/json',]
        key :tags, ['Contacts']

        parameter name: :contact do
          key :in, :body
          key :description, 'Contact to register'
          key :required, true
          schema do
            key :'$ref', :ContactInputPost
          end
        end

        response 201 do
          key :description, 'contact response'
          schema do
            key :'$ref', :ContactOutput
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