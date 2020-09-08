module Api
  module V1
    class ResearcherController < ApplicationController
      before_action :set_researcher, only: [:show, :update]

      def index
        #Listar todos los convenios
        @researchers = Researcher.all.order(:created_at)
        paginate json: @researchers
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
        params.require(:researcher).permit(:codeNumber, :identificationNumber,
                                           :orcid_id, :scientific_signature)
      end
    end
  end
end
