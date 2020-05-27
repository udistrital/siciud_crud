class CallSerializer < ActiveModel::Serializer
  attributes :callNumber, :registerDate, :description, :call_type_id, :call_user_role_id,
             :duration, :globalBudget, :maxBudgetPerProject, :startDate, :closingDate,
             :directedTowards, :thematic_axes, :productions

  def productions
    self.object.call_productions.map do |production_item|
      {
          'production_id': production_item.production_id,
          'required': production_item.required,
          'quantity': production_item.quantity
      }
    end
  end

  def thematic_axes
    self.object.thematic_axes.map do |thematic_axis|
      thematic_axis.id
    end
  end
end
