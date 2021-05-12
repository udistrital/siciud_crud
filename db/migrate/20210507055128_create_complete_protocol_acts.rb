class CreateCompleteProtocolActs < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_protocol_acts
  end
end
