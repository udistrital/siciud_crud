class Budget < ApplicationRecord
  include Swagger::BudgetSchema
  
  belongs_to :task
end
