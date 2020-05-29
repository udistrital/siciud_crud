class CallSerializer < ActiveModel::Serializer
  attributes :callNumber, :registerDate, :description, :call_type_id, :call_user_role_id,
             :duration, :globalBudget, :maxBudgetPerProject, :startDate, :closingDate,
             :directedTowards, :thematic_axes, :productions, :item_calls, :required_documents

  def required_documents
    self.object.calls_required_documents.map do |call_required_doc|
      {
          'required_document_id': call_required_doc.required_document_id,
          'required': call_required_doc.required
      }
    end
  end

  def item_calls
    self.object.call_item_calls.map do |call_item|
      {
          'item_id': call_item.item_call_id,
          'percentage': call_item.percentage,
          'value': call_item.value,
          'maximum_percentage': call_item.maximum_percentage
      }
    end
  end

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
