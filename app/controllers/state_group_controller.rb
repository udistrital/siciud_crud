class StateGroupController < ApplicationController
  before_action :set_state_group, only: [:show]

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: {error: e.message}, status: :not_found
  end

  def index
    @states_group = StateGroup.all
    render json: @states_group
  end

  def show
    render json: @state_group
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_state_group
      @state_group = StateGroup.find(params[:id])
    end

end
