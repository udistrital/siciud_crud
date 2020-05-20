class Call < ApplicationRecord
  belongs_to :call_type
  belongs_to :call_user_role

  # after_initialize :generate_callNumber
  #
  # def generate_callNumber
  #   self.callNumber = CallsSearchService.search(self, self.registerDate)
  # end
end
