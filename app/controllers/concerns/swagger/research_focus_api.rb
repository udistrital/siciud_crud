module Swagger::ResearchFocusApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/research_focus/{id}' do
      operation :get do
        key :summary, 'Get a Research Focus by ID'
        key :description, 'Returns a single research focus'
        key :operationId, :get_research_focus_by_id
        key :produces, ['application/json',]
        key :tags, ['Research Focuses']

        parameter name: :id do
          key :in, :path
          key :description, 'ID of research focus to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'research focus response'
          schema do
            key :'$ref', :ResearchFocusOutput
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

      # operation :put do
      #   key :summary, 'Update Research Focus by ID'
      #   key :description, 'Returns the updated research focus'
      #   key :operationId, :update_research_focus
      #   key :produces, ['application/json',]
      #   key :tags, ['Research Focuses']
      #
      #   parameter name: :id do
      #     key :in, :path
      #     key :description, 'ID of research focus to fetch'
      #     key :required, true
      #     key :type, :integer
      #     key :format, :int64
      #   end
      #
      #   parameter name: :research_focus do
      #     key :in, :body
      #     key :description, 'Research Focus to update'
      #     key :required, true
      #     schema do
      #       key :'$ref', :ResearchFocusInput
      #     end
      #   end
      #
      #   response 200 do
      #     key :description, 'research focus response'
      #     schema do
      #       key :'$ref', :ResearchFocusOutput
      #     end
      #   end
      #   response 422 do
      #     key :description, 'Unprocessable Entity'
      #     schema do
      #       key :'$ref', :ErrorUnprocessableEntity
      #     end
      #   end
      #   response :default do
      #     key :description, 'Unexpected Error'
      #   end
      # end
    end

    swagger_path '/research_focus/' do
      operation :get do
        key :summary, 'Get all Research Focuses'
        key :description, 'Returns all research focuses'
        key :operationId, :get_research_focuses
        key :produces, ['application/json',]
        key :tags, ['Research Focuses']

        response 200 do
          key :description, 'research focus response'
          schema do
            key :type, :array
            items do
              key :'$ref', :ResearchFocusOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      # operation :post do
      #   key :summary, 'Create a new Research Focus'
      #   key :description, 'Returns the created research focus'
      #   key :operationId, :create_research_focus
      #   key :produces, ['application/json',]
      #   key :tags, ['Research Focuses']
      #
      #   parameter name: :research_focus do
      #     key :in, :body
      #     key :description, 'Research Focus to register'
      #     key :required, true
      #     schema do
      #       key :'$ref', :ResearchFocusInput
      #     end
      #   end
      #
      #   response 201 do
      #     key :description, 'research focus response'
      #     schema do
      #       key :'$ref', :ResearchFocusOutput
      #     end
      #   end
      #   response 422 do
      #     key :description, 'Unprocessable Entity'
      #     schema do
      #       key :'$ref', :ErrorUnprocessableEntity
      #     end
      #   end
      #   response :default do
      #     key :description, 'Unexpected Error'
      #   end
      # end
    end
  end
end