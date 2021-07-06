module Swagger::IntParticipantApi
  extend ActiveSupport::Concern
  include Swagger::Blocks
  require './app/models/concerns/constant.rb'

  PRODUCT_ARRAY = get_product_array

  included do
    swagger_path '/{product_name}/{producible_id}/int_participants/{id}' do
      operation :get do
        key :summary, 'Get an Internal Participant of a Product by ID'
        key :description, 'Returns a single internal participant'
        key :operationId, :get_int_participant_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::Internal Participants']

        parameter name: :product_name do
          key :in, :path
          key :description, 'Product name or production name to fetch, e. g.,
            books, papers and patents, among others (see all the names of the production "url names").'
          key :enum, PRODUCT_ARRAY
          key :required, true
          key :type, :string
        end
        parameter name: :producible_id do
          key :in, :path
          key :description, 'Product ID or production ID to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end
        parameter name: :id do
          key :in, :path
          key :description, 'ID of internal participant to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'internal participant response'
          schema do
            key :'$ref', :IntParticipantOutput
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
        key :summary, 'Update Internal Participant of a Product by ID'
        key :description, 'Returns the updated internal participant'
        key :operationId, :update_int_participant
        key :produces, ['application/json',]
        key :tags, ['Products::Internal Participants']

        parameter name: :product_name do
          key :in, :path
          key :description, 'Product name or production name to fetch, e. g.,
            books, papers and patents, among others (see all the names of the production "url names").'
          key :enum, PRODUCT_ARRAY
          key :required, true
          key :type, :string
        end
        parameter name: :producible_id do
          key :in, :path
          key :description, 'Product ID or production ID to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end
        parameter name: :id do
          key :in, :path
          key :description, 'ID of internal participant to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :int_participant do
          key :in, :body
          key :description, 'Internal Participant to update'
          key :required, true
          schema do
            key :'$ref', :IntParticipantInput
          end
        end

        response 200 do
          key :description, 'internal participant response'
          schema do
            key :'$ref', :IntParticipantOutput
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

    swagger_path '/{product_name}/{producible_id}/int_participants' do
      operation :get do
        key :summary, 'Get all Internal Participants of a Product by ID'
        key :description, 'Returns all internal participants'
        key :operationId, :get_int_participants
        key :produces, ['application/json',]
        key :tags, ['Products::Internal Participants']

        parameter name: :product_name do
          key :in, :path
          key :description, 'Product name or production name to fetch, e. g.,
            books, papers and patents, among others (see all the names of the production "url names").'
          key :enum, PRODUCT_ARRAY
          key :required, true
          key :type, :string
        end
        parameter name: :producible_id do
          key :in, :path
          key :description, 'Product ID or production ID to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'internal participant response'
          schema do
            key :type, :array
            items do
              key :'$ref', :IntParticipantOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Internal Participant'
        key :description, 'Returns the created internal participant'
        key :operationId, :create_int_participant
        key :produces, ['application/json',]
        key :tags, ['Products::Internal Participants']

        parameter name: :product_name do
          key :in, :path
          key :description, 'Product name or production name to fetch, e. g.,
            books, papers and patents, among others (see all the names of the production "url names").'
          key :enum, PRODUCT_ARRAY
          key :required, true
          key :type, :string
        end
        parameter name: :producible_id do
          key :in, :path
          key :description, 'Product ID or production ID to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :int_participant do
          key :in, :body
          key :description, 'Internal Participant to register'
          key :required, true
          schema do
            key :'$ref', :IntParticipantInput
          end
        end

        response 201 do
          key :description, 'internal participant response'
          schema do
            key :'$ref', :IntParticipantOutput
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