module Api
  module V1
    class ResearcherController < ApplicationController
      before_action :set_researcher, only: [:show, :update]

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      def index
        @researchers = Researcher.all.order(:created_at)
        if (id_number = params[:identification_number])
          @researchers = ResearcherSearchService.search_researcher(@researchers,
                                                                   id_number)
          if @researchers.empty?
            render json: {'message': 'Usuario no existe'}, status: :not_found
          else
            render json: @researchers
          end
        else
          paginate json: @researchers
        end
      end

      def show
        render json: @researcher
      end

      def create
        @researcher = Researcher.new(researcher_params)
        if @researcher.save
          render json: @researcher, status: :created
        else
          render json: @researcher.errors, status: :unprocessable_entity
        end
      end

      def update
        if @researcher.update(researcher_params)
          render json: @researcher
        else
          render json: @researcher.errors, status: :unprocessable_entity
        end
      end

      private

      def set_researcher
        @researcher = Researcher.find(params[:id])
      end

      def researcher_params
        params.require(:researcher).permit(:identification_number,
                                           :orcid_id, :scientific_signature,
                                           :oas_researcher_id, :mobile_number,
                                           :address)
      end
    end
  end
end
