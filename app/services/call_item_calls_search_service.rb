class CallItemCallsSearchService
  def self.count_total_percentage(curr_items, percentage)
    curr_items.sum(:percentage) + percentage
  end

  def self.calculate_cash_value(budget_project, percentage)
    budget_project * (percentage/100)
  end

  def self.validate_pct_less_than_maximum_pct(pct, max_pct)
    pct <= max_pct
  end
end
