module Api
  module V1
    class CallsController < ApplicationController
      before_action :set_call, only: [:show, :update]

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
        render json: @call, status: :ok
      end

      def create
        @call = Call.new(call_params)
        if @call.valid?
          @call.registerDate = DateTime.now.in_time_zone(-5).to_date
          @call.callNumber = CallsSearchService.count_calls(Call, @call.registerDate)
          @call.closingDate = CallsSearchService.calculate_closing_date(
              @call.duration, @call.duration_type_id, @call.startDate)
          if @call.save
            render json: @call, status: :created
          else
            render json: @call.errors, status: :unprocessable_entity
          end
        else
          render json: @call.errors, status: :unprocessable_entity
        end
      end

      def update
        calculate_duration = false
        if params['call'].has_key?('duration')
          @call.duration = params['call']['duration']
          calculate_duration = true
        end

        if params['call'].has_key?('duration_type_id')
          @call.duration_type_id = params['call']['duration_type_id']
          calculate_duration = true
        end

        if calculate_duration
          @call.closingDate = CallsSearchService.calculate_closing_date(
              @call.duration, @call.duration_type_id, @call.startDate)
        end

        if @call.update(call_params)
          render json: @call, status: :ok
        else
          render json: @call.errors, status: :unprocessable_entity
        end
      end

      private

      def call_params
        params.require(:call).permit(:name, :description,
                                     :call_type_id,
                                     :call_user_role_id, :duration,
                                     :duration_type_id,
                                     :globalBudget, :maxBudgetPerProject,
                                     :startDate, :directedTowards)
      end

      def set_call
        @call = Call.find(params[:id])
      end
    end
  end
end