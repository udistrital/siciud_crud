class CallSerializer < ActiveModel::Serializer
  attributes :callNumber, :registerDate, :description, :call_type_id, :call_user_role_id,
             :duration, :globalBudget, :maxBudgetPerProject, :startDate, :closingDate,
             :directedTowards, :thematic_axes

  def thematic_axes
    self.object.thematic_axes.map do |thematic_axis|
      {
          id: thematic_axis.id,
          name: thematic_axis.name
      }
    end
  end
end
