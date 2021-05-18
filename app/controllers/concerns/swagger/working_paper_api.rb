module Swagger::WorkingPaperApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/working_papers/{id}' do
      operation :get do
        key :summary, 'Get a Working Paper by ID'
        key :description, 'Returns a single Working Paper'
        key :operationId, :get_working_paper_by_id
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Working Papers']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Working Paper to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'working paper response'
          schema do
            key :'$ref', :WorkingPaperOutput
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
        key :summary, 'Update Working Paper by ID'
        key :description, 'Returns the updated Working Paper'
        key :operationId, :update_working_paper
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Working Papers']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Working Paper to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :working_paper do
          key :in, :body
          key :description, 'Working Paper to update'
          key :required, true
          schema do
            key :'$ref', :WorkingPaperInputPut
          end
        end

        response 200 do
          key :description, 'working paper response'
          schema do
            key :'$ref', :WorkingPaperOutput
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
        key :summary, 'Activate or deactivate a Working Paper by ID'
        key :description, 'Returns the activated/deactivated Working Paper'
        key :operationId, :change_active_working_paper
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Working Papers']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of Working Paper to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :working_paper do
          key :in, :body
          key :description, 'Working Paper to activate or deactivate'
          key :required, true
          schema do
            property :working_paper do
              key :'$ref', :ChangeActive
            end
          end
        end

        response 200 do
          key :description, 'working paper response'
          schema do
            key :'$ref', :WorkingPaperOutput
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

    swagger_path '/research_units/{research_group_id}/working_papers' do
      operation :get do
        key :summary, 'Get all Working Papers'
        key :description, 'Returns all Working Papers'
        key :operationId, :get_working_papers
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Working Papers']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'working paper response'
          schema do
            key :type, :array
            items do
              key :'$ref', :WorkingPaperDxOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Working Papers'
        key :description, 'Returns the created Working Paper'
        key :operationId, :create_working_paper
        key :produces, ['application/json',]
        key :tags, ['Products::Social Appropriation of Knowledge::Working Papers']

        parameter name: :research_group_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :working_paper do
          key :in, :body
          key :description, 'Working Paper to register'
          key :required, true
          schema do
            key :'$ref', :WorkingPaperInputPost
          end
        end

        response 201 do
          key :description, 'working paper response'
          schema do
            key :'$ref', :WorkingPaperOutput
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