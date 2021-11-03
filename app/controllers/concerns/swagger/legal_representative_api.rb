module Swagger::LegalRepresentativeApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/legal_representatives/{id}' do
      operation :get do
        key :summary, 'Get a Legal Representative by ID'
        key :description, 'Returns a single Legal Representative'
        key :operationId, :get_legal_representative_by_id
        key :produces, ['application/json',]
        key :tags, ['Legal Representatives']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Legal Representative to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'Legal Representative response'
          schema do
            key :'$ref', :LegalRepresentativeOutput
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
        key :summary, 'Update Legal Representative by ID'
        key :description, 'Returns the updated Legal Representative'
        key :operationId, :update_legal_representative
        key :produces, ['application/json',]
        key :tags, ['Legal Representatives']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Legal Representative to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :legal_representative do
          key :in, :body
          key :description, 'Legal Representative to update'
          key :required, true
          schema do
            key :'$ref', :LegalRepresentativeInputPut
          end
        end

        response 200 do
          key :description, 'Legal Representative response'
          schema do
            key :'$ref', :LegalRepresentativeOutput
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
        key :summary, 'Activate or deactivate a Legal Representative by ID'
        key :description, 'Returns the activated/deactivated Legal Representative'
        key :operationId, :change_active_legal_representative
        key :produces, ['application/json',]
        key :tags, ['Legal Representatives']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Legal Representative to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :legal_representative do
          key :in, :body
          key :description, 'Legal Representative to activate or deactivate'
          key :required, true
          schema do
            property :legal_representative do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'Legal Representative response'
          schema do
            key :'$ref', :LegalRepresentativeOutput
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

    swagger_path '/legal_representatives' do
      operation :get do
        key :summary, 'Get all Legal Representatives'
        key :description, 'Returns all Legal Representatives'
        key :operationId, :get_legal_representatives
        key :produces, ['application/json',]
        key :tags, ['Legal Representatives']

        parameter name: :identification_number do
          key :in, :query
          key :description, 'identification number'
          key :required, false
          key :type, :string
        end

        response 200 do
          key :description, 'Legal Representative response'
          schema do
            key :type, :array
            items do
              key :'$ref', :LegalRepresentativeDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Legal Representative'
        key :description, 'Returns the created Legal Representative'
        key :operationId, :create_legal_representative
        key :produces, ['application/json',]
        key :tags, ['Legal Representatives']

        parameter name: :legal_representative do
          key :in, :body
          key :description, 'Legal Representative to register'
          key :required, true
          schema do
            key :'$ref', :LegalRepresentativeInputPost
          end
        end

        response 201 do
          key :description, 'Legal Representative response'
          schema do
            key :'$ref', :LegalRepresentativeOutput
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