module Api
  module V1
    class ResearchersController < ApplicationController
      include Swagger::ResearcherApi

      before_action :set_researcher, only: [:show, :update]

      def index
        @researchers = Researcher.all.order(:created_at)
        if (id_number = params[:identification_number])
          @researchers = ResearcherSearchService.search_researcher(@researchers,
                                                                   id_number)
        end
        render json: @researchers
      end

      def show
        render json: @researcher
      end

      def create
        @researcher = Researcher.new(researcher_params_create)
        if @researcher.save
          render json: @researcher, status: :created
        else
          render json: @researcher.errors, status: :unprocessable_entity
        end
      end

      def update
        if @researcher.update(researcher_params_update)
          render json: @researcher
        else
          render json: @researcher.errors, status: :unprocessable_entity
        end
      end

      def researcher_research_units
        research_units = ResearchUnitsByResearcher.where(
          identification_number: params[:identification_number]
        )

        render json: research_units
      end

      private

      def set_researcher
        @researcher = Researcher.find(params[:id])
      end

      def researcher_params_create
        params.require(:researcher).permit(:identification_number,
                                           :orcid_id, :scientific_signature,
                                           :oas_researcher_id, :mobile_number_one,
                                           :mobile_number_two, :phone_number_one,
                                           :phone_number_two,
                                           :address,
                                           :created_by)
      end

      def researcher_params_update
        params.require(:researcher).permit(:identification_number,
                                           :orcid_id, :scientific_signature,
                                           :oas_researcher_id, :mobile_number_one,
                                           :mobile_number_two, :phone_number_one,
                                           :phone_number_two,
                                           :address,
                                           :updated_by)
      end
    end
  end
end
