module Swagger::HistLegalRepresentativeApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/hist_legal_representatives/{id}' do
      operation :get do
        key :summary, 'Get a Historical Legal Representative by ID'
        key :description, 'Returns a single historical Legal Representative'
        key :operationId, :get_hist_legal_representative_by_id
        key :produces, ['application/json',]
        key :tags, ['Entities::Historical Legal Representatives']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of historical Legal Representative to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'historical legal representative response'
          schema do
            key :'$ref', :HistLegalRepresentativeOutput
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
        key :summary, 'Update Historical Legal Representative by ID'
        key :description, 'Returns the updated historical Legal Representative'
        key :operationId, :update_hist_legal_representative
        key :produces, ['application/json',]
        key :tags, ['Entities::Historical Legal Representatives']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of historical Legal Representative to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :hist_legal_representative do
          key :in, :body
          key :description, 'Historical Legal Representative to update'
          key :required, true
          schema do
            key :'$ref', :HistLegalRepresentativeInputPut
          end
        end

        response 200 do
          key :description, 'historical Legal Representative response'
          schema do
            key :'$ref', :HistLegalRepresentativeOutput
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
        key :summary, 'Activate or deactivate a Historical Legal Representative by ID'
        key :description, 'Returns the activated/deactivated historical Legal Representative'
        key :operationId, :change_active_hist_legal_representative
        key :produces, ['application/json',]
        key :tags, ['Entities::Historical Legal Representatives']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of hist Legal Representative to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :hist_legal_representative do
          key :in, :body
          key :description, 'Historical Legal Representative to activate or deactivate'
          key :required, true
          schema do
            property :hist_legal_representative do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'historical legal representative response'
          schema do
            key :'$ref', :HistLegalRepresentativeOutput
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

    swagger_path '/entities/{entity_id}/hist_legal_representatives' do
      operation :get do
        key :summary, 'Get all Historical Legal Representatives'
        key :description, 'Returns all historical Legal Representatives'
        key :operationId, :get_hist_legal_representatives
        key :produces, ['application/json',]
        key :tags, ['Entities::Historical Legal Representatives']

        parameter name: :entity_id do
          key :in, :path
          key :description, 'ID of entity to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'historical legal representative response'
          schema do
            key :type, :array
            items do
              key :'$ref', :HistLegalRepresentativeDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Historical Legal Representative'
        key :description, 'Returns the created historical Legal Representative'
        key :operationId, :create_hist_legal_representative
        key :produces, ['application/json',]
        key :tags, ['Entities::Historical Legal Representatives']

        parameter name: :entity_id do
          key :in, :path
          key :description, 'ID of entity to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :hist_legal_representative do
          key :in, :body
          key :description, 'Historical Legal Representative to register'
          key :required, true
          schema do
            key :'$ref', :HistLegalRepresentativeInputPost
          end
        end

        response 201 do
          key :description, 'historical legal representative response'
          schema do
            key :'$ref', :HistLegalRepresentativeOutput
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