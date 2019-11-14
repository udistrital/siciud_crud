module Api
  module V1
    class CurricularProjectController < ApplicationController
      before_action :set_faculty
      before_action :set_curricular_project, only: [:show]
      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: { error: e.message }, status: :not_found
      end

      def index
        render json: @faculty.curricular_projects.order(:created_at)
      end

      def show
        render json: @curricular_project
      end

      private

      def set_faculty
        @faculty = Faculty.find(params[:faculty_id])
      end

      def set_curricular_project
        @curricular_project = @faculty.curricular_projects.find(params[:id])
      end
    end
  end
end
