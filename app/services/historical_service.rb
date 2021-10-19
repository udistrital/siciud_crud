class HistoricalService

  def self.has_current(model, filter)
    current_total = model.where(filter).count
    current_total > 0
  end

  def self.remove_current(model, filter)
    current = model.where(filter)
    if current
      current.map do |curr|
        curr.update({is_current: false })
      end
    end
  end
end