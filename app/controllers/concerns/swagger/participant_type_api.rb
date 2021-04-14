module Swagger::ParticipantTypeApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/participant_types/{id}' do
      operation :get do
        key :summary, 'Get Participant Type by ID'
        key :description, 'Returns a single participant type'
        key :operationId, :get_participant_type_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::Participant Types']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of participant type to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'participant type response'
          schema do
            key :'$ref', :ParticipantTypeOutput
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
        key :summary, 'Update Participant Type by ID'
        key :description, 'Returns the updated participant type'
        key :operationId, :update_participant_type
        key :produces, ['application/json',]
        key :tags, ['Products::Participant Types']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of participant type to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end
        parameter name: :ParticipantType do
          key :in, :body
          key :description, 'Participant Type to update'
          key :required, true
          schema do
            key :'$ref', :ParticipantTypeInput
          end
        end

        response 200 do
          key :description, 'participant type response'
          schema do
            key :'$ref', :ParticipantTypeOutput
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

    swagger_path '/participant_types/' do
      operation :get do
        key :summary, 'Get all Participant Types'
        key :description, 'Returns all participant types'
        key :operationId, :get_participant_types
        key :produces, ['application/json',]
        key :tags, ['Products::Participant Types']

        response 200 do
          key :description, 'participant type response'
          schema do
            key :type, :array
            items do
              key :'$ref', :ParticipantTypeOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Participant Type'
        key :description, 'Returns the created participant type'
        key :operationId, :create_participant_type
        key :produces, ['application/json',]
        key :tags, ['Products::Participant Types']

        parameter name: :ParticipantType do
          key :in, :body
          key :description, 'Participant Type to register'
          key :required, true
          schema do
            key :'$ref', :ParticipantTypeInput
          end
        end

        response 201 do
          key :description, 'participant type response'
          schema do
            key :'$ref', :ParticipantTypeOutput
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