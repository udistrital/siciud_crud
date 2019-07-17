class FacultyController < ApplicationController
  before_action :set_faculty, only: [:show]

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { error: e.message }, status: :not_found
  end

  def index
    #Listar todas las facultades
    @faculties = Faculty.all
    render json: @faculties, adapter: nil
  end

  #Listar en detalle una facultad
  def show
    render json: @faculty
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_faculty
    @faculty = Faculty.find(params[:id])
  end
end
