class HistContact < ApplicationRecord
  include Swagger::HistContactSchema
  belongs_to :contact
  belongs_to :dependency
end
