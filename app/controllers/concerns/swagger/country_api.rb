module Swagger::CountryApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path "/api/v1/country" do
      operation :get do
        key :description, "Obtener todos los paises"
        key :operationId, :get_all_countries
        key :produces, [
          "application/json",
        ]
        key :tags, [:Paises]
        response 200 do
          key :description, "Country response"
          schema do
            key :type, :array
            items do
              #property :country do
              key :type, :string
              #end              #
              #   key :'$ref', :country
            end
          end
        end
      end
    end
    swagger_path "/api/v1/country/{name}" do
      operation :get do
        key :description, "Obtener las ciudades de un pais"
        key :operationId, :get_all_cities
        key :produces, [
          "application/json",
        ]
        key :tags, [:Paises]
        parameter name: :name do
          key :in, :path
          key :description, "Nombre de la ciudad"
          key :required, true
          key :type, :string
        end
        response 200 do
          key :description, "Ciudad"
          schema do
            key :type, :array
            items do
              #property :city do
              key :type, :string
              #end
            end
          end
        end
      end
    end
  end
end
