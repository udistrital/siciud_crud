module Swagger::NewGeneticSequenceApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/new_genetic_sequences/{id}' do
      operation :get do
        key :summary, 'Get a New Genetic Sequence by ID'
        key :description, 'Returns a single New Genetic Sequence'
        key :operationId, :get_new_genetic_sequence_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::New Genetic Sequences']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of New Genetic Sequence to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'New Genetic Sequence response'
          schema do
            key :'$ref', :NewGeneticSequenceOutput
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
        key :summary, 'Update New Genetic Sequence by ID'
        key :description, 'Returns the updated New Genetic Sequence'
        key :operationId, :update_new_genetic_sequence
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::New Genetic Sequences']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of New Genetic Sequence to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :new_genetic_sequence do
          key :in, :body
          key :description, 'New Genetic Sequence to update'
          key :required, true
          schema do
            key :'$ref', :NewGeneticSequenceInputPut
          end
        end

        response 200 do
          key :description, 'New Genetic Sequence response'
          schema do
            key :'$ref', :NewGeneticSequenceOutput
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
        key :summary, 'Activate or deactivate a New Genetic Sequence by ID'
        key :description, 'Returns the activated/deactivated New Genetic Sequence'
        key :operationId, :change_active_new_genetic_sequence
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::New Genetic Sequences']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of New Genetic Sequence to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :new_genetic_sequence do
          key :in, :body
          key :description, 'New Genetic Sequence to activate or deactivate'
          key :required, true
          schema do
            property :new_genetic_sequence do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'New Genetic Sequence response'
          schema do
            key :'$ref', :NewGeneticSequenceOutput
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

    swagger_path '/research_units/{research_group_id}/new_genetic_sequences' do
      operation :get do
        key :summary, 'Get all New Genetic Sequences'
        key :description, 'Returns all New Genetic Sequences'
        key :operationId, :get_new_genetic_sequences
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::New Genetic Sequences']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'New Genetic Sequence response'
          schema do
            key :type, :array
            items do
              key :'$ref', :NewGeneticSequenceDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new New Genetic Sequences'
        key :description, 'Returns the created New Genetic Sequence'
        key :operationId, :create_new_genetic_sequence
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::New Genetic Sequences']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :new_genetic_sequence do
          key :in, :body
          key :description, 'New Genetic Sequence to register'
          key :required, true
          schema do
            key :'$ref', :NewGeneticSequenceInputPost
          end
        end

        response 201 do
          key :description, 'New Genetic Sequence response'
          schema do
            key :'$ref', :NewGeneticSequenceOutput
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