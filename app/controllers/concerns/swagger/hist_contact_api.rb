module Swagger::HistContactApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/hist_contacts/{id}' do
      operation :get do
        key :summary, 'Get a Historical Contacts by ID'
        key :description, 'Returns a single historical Contacts'
        key :operationId, :get_hist_contact_by_id
        key :produces, ['application/json',]
        key :tags, ['Dependencies:: Historical Contacts']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of historical contacts to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'historical contact response'
          schema do
            key :'$ref', :HistContactOutput
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
        key :summary, 'Update Historical Contacts by ID'
        key :description, 'Returns the updated historical Contacts'
        key :operationId, :update_hist_contact
        key :produces, ['application/json',]
        key :tags, ['Dependencies:: Historical Contacts']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of historical contact to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :hist_contact do
          key :in, :body
          key :description, 'Historical Contact to update'
          key :required, true
          schema do
            key :'$ref', :HistContactInputPut
          end
        end

        response 200 do
          key :description, 'historical contact response'
          schema do
            key :'$ref', :HistContactOutput
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
        key :summary, 'Activate or deactivate a Historical Contacts by ID'
        key :description, 'Returns the activated/deactivated historical Contacts'
        key :operationId, :change_active_hist_contact
        key :produces, ['application/json',]
        key :tags, ['Dependencies:: Historical Contacts']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of historical contact to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :hist_contact do
          key :in, :body
          key :description, 'Historical Contacts to activate or deactivate'
          key :required, true
          schema do
            property :hist_contact do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'historical contact response'
          schema do
            key :'$ref', :HistContactOutput
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

    swagger_path '/dependencies/{dependency_id}/hist_contacts' do
      operation :get do
        key :summary, 'Get all Historical Contacts'
        key :description, 'Returns all historical Contacts'
        key :operationId, :get_hist_contacts
        key :produces, ['application/json',]
        key :tags, ['Dependencies:: Historical Contacts']

        parameter name: :dependency_id do
          key :in, :path
          key :description, 'ID of dependency to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'historical Contact response'
          schema do
            key :type, :array
            items do
              key :'$ref', :HistContactDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Historical Contacts'
        key :description, 'Returns the created historical Contacts'
        key :operationId, :create_hist_contact
        key :produces, ['application/json',]
        key :tags, ['Dependencies:: Historical Contacts']

        parameter name: :dependency_id do
          key :in, :path
          key :description, 'ID of dependency to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :hist_contact do
          key :in, :body
          key :description, 'Historical Contact to register'
          key :required, true
          schema do
            key :'$ref', :HistContactInputPost
          end
        end

        response 201 do
          key :description, 'historical contact response'
          schema do
            key :'$ref', :HistContactOutput
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