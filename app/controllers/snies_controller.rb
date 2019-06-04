class SniesController < ApplicationController

  before_action :set_snies, only: [:show]

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: {error: e.message}, status: :not_found
  end

  #Listar todas las areas de conocimiento SNIES
  def index
    @snies = Snies.all
    render json: @snies
  end

  #Listar en detalle un area de conocimiento SNIES
  def show
    render json: @snies
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_snies
    @snies = Snies.find(params[:id])
  end

end
