class Production < ApplicationRecord
  has_and_belongs_to_many :calls
end
