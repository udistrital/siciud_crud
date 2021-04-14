module Swagger::ScientificNoteApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/research_group/{research_group_id}/scientific_notes/{id}' do
      operation :get do
        key :summary, 'Get a Scientific Note of a Research Unit by ID'
        key :description, 'Returns a single scientific note of a Research Unit'
        key :operationId, :get_scientific_note_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Scientific Notes']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of scientific note of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'scientific note response'
          schema do
            key :'$ref', :ScientificNoteOutput
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
        key :summary, 'Update Scientific Note by ID'
        key :description, 'Returns the updated scientific note of a Research Unit'
        key :operationId, :update_scientific_note
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Scientific Notes']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of scientific note of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :scientific_note do
          key :in, :body
          key :description, 'Scientific note to update'
          key :required, true
          schema do
            key :'$ref', :ScientificNoteInput
          end
        end

        response 200 do
          key :description, 'scientific note response'
          schema do
            key :'$ref', :ScientificNoteOutput
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

    swagger_path '/research_group/{research_group_id}/scientific_notes/' do
      operation :get do
        key :summary, 'Get all Scientific Notes'
        key :description, 'Returns all scientific notes of a research unit to fetch'
        key :operationId, :get_scientific_notes
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Scientific Notes']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'scientific note response'
          schema do
            key :type, :array
            items do
              key :'$ref', :ScientificNoteDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Scientific Note'
        key :description, 'Returns the created scientific note of a research unit'
        key :operationId, :create_scientific_note
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Scientific Notes']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :scientific_note do
          key :in, :body
          key :description, 'scientific note to register'
          key :required, true
          schema do
            key :'$ref', :ScientificNoteInput
          end
        end

        response 201 do
          key :description, 'scientific note response'
          schema do
            key :'$ref', :ScientificNoteOutput
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