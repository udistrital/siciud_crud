module Swagger::ErrorSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :ErrorNotFound do
      property :error do
        key :type, :string
      end
    end

    swagger_schema :ErrorUnprocessableEntity do
      property :property_not_valid do
        key :type, :array
        items do
          key :type, :string
        end
      end
    end
  end
end
