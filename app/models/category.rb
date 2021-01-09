class Category < ApplicationRecord
  include Swagger::CategorySchema

  belongs_to :product_type
end
