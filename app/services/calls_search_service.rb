class CallsSearchService
  def self.search(curr_calls, registerDate)
    year = registerDate.year
    call_count = curr_calls.where(:registerDate => "#{year}-01-01".."#{year}-12-31").count
    call_count += 1
  end
end