module Swagger::ExtParticipantApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  PRODUCT_ARRAY = [:books, :book_chapters,
                   :ip_livestock_breeds, :new_animal_breeds,
                   :papers, :patents, :research_creation_works,
                   :scientific_notes, :vegetable_varieties,
                   :industrial_designs, :integrated_circuit_diagrams,
                   :software, :plant_ind_prototypes,
                   :new_scientific_records,
                   :events,
                   :degree_works]

  included do
    swagger_path '/{product_name}/{producible_id}/ext_participants/{id}' do
      operation :get do
        key :summary, 'Get an External Participant of a Product by ID'
        key :description, 'Returns a single external participant'
        key :operationId, :get_external_participant_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::External Participants']

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
          key :description, 'ID of external participant to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'external participant response'
          schema do
            key :'$ref', :ExtParticipantOutput
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
        key :summary, 'Update External Participant of a Product by ID'
        key :description, 'Returns the updated external participant'
        key :operationId, :update_external_participant
        key :produces, ['application/json',]
        key :tags, ['Products::External Participants']

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
          key :description, 'ID of external participant to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :ext_participant do
          key :in, :body
          key :description, 'External Participant to update'
          key :required, true
          schema do
            key :'$ref', :ExtParticipantInput
          end
        end

        response 200 do
          key :description, 'external participant response'
          schema do
            key :'$ref', :ExtParticipantOutput
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

    swagger_path '/{product_name}/{producible_id}/ext_participants/' do
      operation :get do
        key :summary, 'Get all External Participants of a Product by ID'
        key :description, 'Returns all external participants'
        key :operationId, :get_ext_participants
        key :produces, ['application/json',]
        key :tags, ['Products::External Participants']

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
          key :description, 'external participant response'
          schema do
            key :type, :array
            items do
              key :'$ref', :ExtParticipantOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new External Participant'
        key :description, 'Returns the created external participant'
        key :operationId, :create_ext_participant
        key :produces, ['application/json',]
        key :tags, ['Products::External Participants']

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

        parameter name: :ext_participant do
          key :in, :body
          key :description, 'External Participant to register'
          key :required, true
          schema do
            key :'$ref', :ExtParticipantInput
          end
        end

        response 201 do
          key :description, 'external participant response'
          schema do
            key :'$ref', :ExtParticipantOutput
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