module Swagger::CallDocumentApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/call_documents/{id}' do
      operation :get do
        key :summary, 'Get a call document by ID'
        key :description, 'Returns a single call document'
        key :operationId, :get_call_document_by_id
        key :produces, ['application/json',]
        key :tags, ['Calls:: Call Documents']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of call document to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'call document response'
          schema do
            key :'$ref', :CallDocumentOutput
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
        key :summary, 'Update call document by ID'
        key :description, 'Returns the updated call document'
        key :operationId, :update_call_document
        key :produces, ['application/json',]
        key :tags, ['Calls:: Call Documents']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of call document to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :call_document do
          key :in, :body
          key :description, 'call document to update'
          key :required, true
          schema do
            key :'$ref', :CallDocumentInputPut
          end
        end

        response 200 do
          key :description, 'call document response'
          schema do
            key :'$ref', :CallDocumentOutput
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
        key :summary, 'Activate or deactivate a call document by ID'
        key :description, 'Returns the activated/deactivated call document'
        key :operationId, :change_active_call_document
        key :produces, ['application/json',]
        key :tags, ['Calls:: Call Documents']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of call document to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :call_document do
          key :in, :body
          key :description, 'call document to activate or deactivate'
          key :required, true
          schema do
            property :call_document do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'call document response'
          schema do
            key :'$ref', :CallDocumentOutput
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

    swagger_path '/calls/{call_id}/call_documents' do
      operation :get do
        key :summary, 'Get all call documents'
        key :description, 'Returns all call documents'
        key :operationId, :get_call_documents
        key :produces, ['application/json',]
        key :tags, ['Calls:: Call Documents']

        parameter name: :call_id do
          key :in, :path
          key :description, 'ID of call to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'call document response'
          schema do
            key :type, :array
            items do
              key :'$ref', :CallDocumentDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new call documents'
        key :description, 'Returns the created call document'
        key :operationId, :create_call_document
        key :produces, ['application/json',]
        key :tags, ['Calls:: Call Documents']

        parameter name: :call_id do
          key :in, :path
          key :description, 'ID of call to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :call_document do
          key :in, :body
          key :description, 'call document to register'
          key :required, true
          schema do
            key :'$ref', :CallDocumentInputPost
          end
        end

        response 201 do
          key :description, 'call document response'
          schema do
            key :'$ref', :CallDocumentOutput
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