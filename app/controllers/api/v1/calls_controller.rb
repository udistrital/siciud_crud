module Api
  module V1
    class CallsController < ApplicationController
      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      def index
        @call = Call.all.order(:created_at)
        render json: @call
      end

      def show
        @call = Call.find(params[:id])
        render json: @call, status: :ok
      end

      def create
        @call = Call.new(call_params)
        @call.registerDate = DateTime.now.in_time_zone(-5).to_date
        @call.callNumber = CallsSearchService.search(Call, @call.registerDate)
        if @call.save
          render json: @call, status: :created
        else
          render json: @call.errors, status: :unprocessable_entity
        end
      end

      private

      def call_params
        params.require(:call).permit(:description,
                                     :call_type_id,
                                     :call_user_role_id, :duration,
                                     :globalBudget, :maxBudgetPerProject,
                                     :startDate, :closingDate,
                                     :directedTowards)
      end
    end
  end
end