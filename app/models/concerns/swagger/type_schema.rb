module Swagger::TypeSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :Type do

    end
  end
end