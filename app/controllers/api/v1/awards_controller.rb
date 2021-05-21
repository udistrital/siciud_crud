module Api
  module V1
    class AwardsController < ApplicationController
      include Swagger::AwardApi

      before_action :set_research_creation_work
      before_action :set_award, only: [:show, :update]

      # GET /research_creation_works/:id/awards
      def index
        @awards = @research_creation_work.awards
        @awards = DxService.load(@awards, params)

        render json: @awards
      end

      # GET /research_creation_works/:id/awards/1
      def show
        render json: @award
      end

      # POST /research_creation_works/:id/awards
      def create
        @award = @research_creation_work.awards.new(award_params_to_create)

        if @award.save
          render json: @award, status: :created
        else
          render json: @award.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_creation_works/:id/awards/1
      def update
        if @award.update(award_params_to_update)
          render json: @award
        else
          render json: @award.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_award
        @award = @research_creation_work.awards.find(params[:id])
      end

      def set_research_creation_work
        @research_creation_work = ResearchCreationWork.find(
          params[:research_creation_work_id])
      end

      # Only allow a trusted parameter "white list" through.
      def award_params_to_create
        params.require(:award).permit(:name, :is_national,
                                      :active, :created_by)
      end

      def award_params_to_update
        params.require(:award).permit(:name, :is_national,
                                      :active, :updated_by)
      end
    end
  end
end
