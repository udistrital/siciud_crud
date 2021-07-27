class AbstractCallController < ApplicationController

  def set_call
    @call = Call.find(params[:call_id])
  end
end