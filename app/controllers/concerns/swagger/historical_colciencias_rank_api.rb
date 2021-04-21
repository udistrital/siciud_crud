module Swagger::HistoricalColcienciasRankApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/research_units/{research_unit_id}/historical_colciencias_ranks/{id}' do
      operation :get do
        key :summary, 'Get a Historical Colciencias Rank of a Research Unit by ID'
        key :description, 'Returns a single historical colciencias rank'
        key :operationId, :get_historical_colciencias_rank_by_id
        key :produces, ['application/json',]
        key :tags, ['Colciencias::Historical Colciencias Ranks']

        parameter name: :research_unit_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of historical colciencias rank of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'historical colciencias rank response'
          schema do
            key :'$ref', :HistoricalColcienciasRankOutput
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
        key :summary, 'Update Historical Colciencias Rank by ID of a Research Unit by ID'
        key :description, 'Returns the updated historical colciencias rank'
        key :operationId, :update_historical_colciencias_rank
        key :produces, ['application/json',]
        key :tags, ['Colciencias::Historical Colciencias Ranks']

        parameter name: :research_unit_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :id do
          key :in, :path
          key :description, 'ID of historical colciencias rank of a research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :historical_colciencias_rank do
          key :in, :body
          key :description, 'Historical Colciencias Rank to update'
          key :required, true
          schema do
            key :'$ref', :HistoricalColcienciasRankInputPut
          end
        end

        response 200 do
          key :description, 'historical colciencias rank response'
          schema do
            key :'$ref', :HistoricalColcienciasRankOutput
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

    swagger_path '/research_units/{research_unit_id}/historical_colciencias_ranks/' do
      operation :get do
        key :summary, 'Get all Historical Colciencias Ranks of a Research Unit by ID'
        key :description, 'Returns all historical colciencias ranks'
        key :operationId, :get_historical_colciencias_ranks
        key :produces, ['application/json',]
        key :tags, ['Colciencias::Historical Colciencias Ranks']

        parameter name: :research_unit_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'historical colciencias rank response'
          schema do
            key :type, :array
            items do
              key :'$ref', :HistoricalColcienciasRankOutput
            end
          end
        end
        response :default do
          key :description, 'Unexpected Error'
        end
      end

      operation :post do
        key :summary, 'Create a new Historical Colciencias Rank of a Research Unit by ID'
        key :description, 'Returns the created book'
        key :operationId, :create_historical_colciencias_rank
        key :produces, ['application/json',]
        key :tags, ['Colciencias::Historical Colciencias Ranks']

        parameter name: :research_unit_id do
          key :in, :path
          key :description, 'ID of research unit to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        parameter name: :historical_colciencias_rank do
          key :in, :body
          key :description, 'Historical Colciencias Rank to register'
          key :required, true
          schema do
            key :'$ref', :HistoricalColcienciasRankInputPost
          end
        end

        response 201 do
          key :description, 'historical colciencias rank response'
          schema do
            key :'$ref', :HistoricalColcienciasRankOutput
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