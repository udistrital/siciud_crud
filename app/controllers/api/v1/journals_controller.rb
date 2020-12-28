module Api
  module V1
    class JournalsController < ApplicationController
      before_action :set_journal, only: [:show, :update]

      # Handling of database exceptions
      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      # GET /journals
      def index
        @journals = Journal.all

        render json: @journals
      end

      # GET /journals/1
      def show
        render json: @journal
      end

      # POST /journals
      def create
        @journal = Journal.new(journal_params)

        if @journal.save
          render json: @journal, status: :created
        else
          render json: @journal.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /journals/1
      def update
        if @journal.update(journal_params)
          render json: @journal
        else
          render json: @journal.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_journal
        @journal = Journal.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def journal_params
        params.require(:journal).permit(:name)
      end
    end
  end
end
