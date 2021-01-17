module Swagger::JournalApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/journals/{id}' do
      operation :get do
        key :summary, 'Get a Journal by ID'
        key :description, 'Returns a single journal'
        key :operationId, :get_journal_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::Journals']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of journal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'journal response'
          schema do
            key :'$ref', :JournalOutput
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
        key :summary, 'Update journal by ID'
        key :description, 'Returns the updated journal'
        key :operationId, :update_journal
        key :produces, ['application/json',]
        key :tags, ['Products::Journals']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of journal to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :journal do
          key :in, :body
          key :description, 'Journal to update'
          key :required, true
          schema do
            key :'$ref', :JournalInput
          end
        end

        response 200 do
          key :description, 'Journal response'
          schema do
            key :'$ref', :JournalOutput
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

    swagger_path '/journals/' do
      operation :get do
        key :summary, 'Get all Journals'
        key :description, 'Returns all journals'
        key :operationId, :get_journals
        key :produces, ['application/json',]
        key :tags, ['Products::Journals']

        response 200 do
          key :description, 'journal response'
          schema do
            key :type, :array
            items do
              key :'$ref', :JournalOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Journal'
        key :description, 'Returns the created journal'
        key :operationId, :create_journal
        key :produces, ['application/json',]
        key :tags, ['Products::Journals']

        parameter name: :journal do
          key :in, :body
          key :description, 'journal to register'
          key :required, true
          schema do
            key :'$ref', :JournalInput
          end
        end

        response 201 do
          key :description, 'journal response'
          schema do
            key :'$ref', :JournalOutput
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