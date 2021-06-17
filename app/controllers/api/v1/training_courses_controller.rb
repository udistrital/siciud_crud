module Api
  module V1
    class TrainingCoursesController < AbstractProductResearchUnitController
      include Swagger::TrainingCourseApi

      before_action :set_research_group, only: [:index, :create]
      before_action :set_training_course, only: [:show, :update]

      # GET research_units/:id/training_courses
      def index
        @training_courses = CompleteTrainingCourse.where(
          research_group_id: params[:research_group_id])
        @training_courses = DxService.load(@training_courses, params)
        render json: @training_courses
      end

      # GET /training_courses/1
      def show
        render json: @training_course
      end

      # POST research_units/:id/training_courses
      def create
        @training_course = @research_group.training_courses.new(
          training_crs_params_to_create)

        if @training_course.save
          render json: @training_course, status: :created
        else
          render json: @training_course.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /training_courses/1
      def update
        if @training_course.update(training_crs_params_to_update)
          render json: @training_course
        else
          render json: @training_course.errors, status: :unprocessable_entity
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_training_course
        @training_course = TrainingCourse.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def training_crs_params_to_create
        params.require(:training_course).permit(:institution, :id_administrative_act,
                                                :program_name, :date, :faculty,
                                                :num_administrative_act, :geo_city_id,
                                                :geo_state_id, :geo_country_id, :category_id,
                                                :research_group_id, :colciencias_call_id,
                                                :observation, :active, :created_by)
      end

      # Only allow a trusted parameter "white list" through.
      def training_crs_params_to_update
        params.require(:training_course).permit(:institution, :id_administrative_act,
                                                :program_name, :date, :faculty,
                                                :num_administrative_act, :geo_city_id,
                                                :geo_state_id, :geo_country_id, :category_id,
                                                :research_group_id, :colciencias_call_id,
                                                :observation, :active, :updated_by)
      end
    end
  end
end