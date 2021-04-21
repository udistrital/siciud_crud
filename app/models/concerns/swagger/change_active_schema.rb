module Swagger::ChangeActiveSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :ChangeActive do
      property :active do
        key :type, :boolean
      end
      property :updated_by do
        key :type, :integer
        key :format, :int64
      end
    end
  end
end
