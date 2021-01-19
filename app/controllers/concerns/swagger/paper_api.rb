module Swagger::PaperApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/research_group/{research_group_id}/papers/{id}' do
      operation :get do
        key :summary, 'Get a Paper of a Research Unit by ID'
        key :description, 'Returns a single paper'
        key :operationId, :get_paper_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Papers']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of paper of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'paper response'
          schema do
            key :'$ref', :PaperOutput
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
        key :summary, 'Update Paper by ID'
        key :description, 'Returns the updated paper'
        key :operationId, :update_paper
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Papers']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of paper of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :paper do
          key :in, :body
          key :description, 'Paper to update'
          key :required, true
          schema do
            key :'$ref', :PaperInput
          end
        end

        response 200 do
          key :description, 'paper response'
          schema do
            key :'$ref', :PaperOutput
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

    swagger_path '/research_group/{research_group_id}/papers/' do
      operation :get do
        key :summary, 'Get all Papers'
        key :description, 'Returns all papers'
        key :operationId, :get_papers
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Papers']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'paper response'
          schema do
            key :type, :array
            items do
              key :'$ref', :PaperDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Paper'
        key :description, 'Returns the created paper'
        key :operationId, :create_paper
        key :produces, ['application/json',]
        key :tags, ['Products::GNK::Papers']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :paper do
          key :in, :body
          key :description, 'Paper to register'
          key :required, true
          schema do
            key :'$ref', :PaperInput
          end
        end

        response 201 do
          key :description, 'paper response'
          schema do
            key :'$ref', :PaperOutput
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