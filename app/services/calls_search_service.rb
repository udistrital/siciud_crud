class CallsSearchService
  def self.count_calls(curr_calls, registerDate)
    year = registerDate.year
    call_count = curr_calls.where(:registerDate => "#{year}-01-01".."#{year}-12-31").count
    call_count += 1
  end

  def self.calculate_closing_date(callType, duration, startDate)
    if callType == 1
      closingDate = startDate + duration.month
    else
      closingDate = startDate + duration.days
    end
    return closingDate
  end
end