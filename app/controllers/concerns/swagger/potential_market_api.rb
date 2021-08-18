module Swagger::PotentialMarketApi
    extend ActiveSupport::Concern
    include Swagger::Blocks
  
    included do
      swagger_path '/potential_markets/{id}' do
        operation :get do
          key :summary, 'Get a Potential market by ID'
          key :description, 'Returns a single Potential market'
          key :operationId, :get_potential_market_by_id
          key :produces, ['application/json',]
          key :tags, ['PotentialMarkets']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of Potential market to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          response 200 do
            key :description, 'Potential market response'
            schema do
              key :'$ref', :PotentialMarketOutput
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
          key :summary, 'Update Potential market by ID'
          key :description, 'Returns the updated Potential market'
          key :operationId, :update_potential_market
          key :produces, ['application/json',]
          key :tags, ['PotentialMarkets']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of PotentialMarket to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          parameter name: :potential_market do
            key :in, :body
            key :description, 'Potential market to update'
            key :required, true
            schema do
              key :'$ref', :PotentialMarketInputPut
            end
          end
  
          response 200 do
            key :description, 'Potential market response'
            schema do
              key :'$ref', :PotentialMarketOutput
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
  
      swagger_path '/procedure_requests/{procedure_request_id}/potential_markets' do
        operation :get do
          key :summary, 'Get the Potential market of one procedure request'
          key :description, 'Returns the Potential market of one procedure request'
          key :operationId, :get_potential_markets
          key :produces, ['application/json',]
          key :tags, ['PotentialMarkets']
  
          parameter name: :procedure_request_id do
            key :in, :path
            key :description, 'ID of procedure request to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          response 200 do
            key :description, 'Potential market response'
            schema do
              key :type, :array
              items do
                key :'$ref', :PotentialMarketOutput
              end
            end
          end
          response :default do
            key :description, 'Unexpected Error'
          end
        end
  
        operation :post do
          key :summary, 'Create a new Potential market'
          key :description, 'Returns the created Potential market'
          key :operationId, :create_potential_market
          key :produces, ['application/json',]
          key :tags, ['PotentialMarkets']
  
          parameter name: :procedure_request_id do
            key :in, :path
            key :description, 'ID of procedure request to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          parameter name: :potential_market do
            key :in, :body
            key :description, 'Potential market to register'
            key :required, true
            schema do
              key :'$ref', :PotentialMarketInputPost
            end
          end
  
          response 201 do
            key :description, 'Potential market response'
            schema do
              key :'$ref', :PotentialMarketOutput
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

      swagger_path '/potential_markets/{id}/active' do
        operation :put do
          key :summary, 'Activate or deactivate a Potential market by ID'
          key :description, 'Returns the activated/deactivated Potential market by id'
          key :operationId, :change_active_procedure
          key :produces, ['application/json',]
          key :tags, ['PotentialMarkets']
  
          parameter name: :id do
            key :in, :path
            key :description, 'ID of Potential market to fetch'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
  
          parameter name: :potential_market do
            key :in, :body
            key :description, 'Potential market to update'
            key :required, true
            schema do
              property :potential_market do
                key :'$ref', :ChangeActive
              end
            end
          end
  
          response 200 do
            key :description, 'Potential market response'
            schema do
              key :'$ref', :PotentialMarketOutput
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