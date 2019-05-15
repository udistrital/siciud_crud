class ResearchFocusController < ApplicationController
  before_action :set_research_focus, only: [:show]

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: {error: e.message}, status: :not_found
  end

  def index
    @research_focuses = ResearchFocus.all
    render json: @research_focuses.includes(:faculty)
  end

  def show
    render json: @research_focus
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_research_focus
      @research_focus = ResearchFocus.find(params[:id])
    end
end
