class CallsSearchService
  def self.count_calls(curr_calls, registerDate)
    year = registerDate.year
    call_count = curr_calls.where(:registerDate => "#{year}-01-01".."#{year}-12-31").count
    call_count += 1
  end

  def self.calculate_closing_date(duration, duration_type, startDate)
    if duration_type == 1
      closingDate = startDate + duration.days
    elsif duration_type == 2
      closingDate = startDate + duration.month
    else
      closingDate = startDate + duration.month
    end
    return closingDate
  end
end