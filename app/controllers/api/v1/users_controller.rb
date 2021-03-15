module Api
  module V1
    class UsersController < ApplicationController
      include Swagger::UserApi

      before_action :set_user, only: [:show, :update, :change_active]
      before_action only: [:change_active] do
        active_in_body_params? user_params_to_deactivate
      end

      rescue_from Exception do |e|
        render json: { error: e.message }, status: :internal_error
      end

      # GET /users
      def index
        if (user_id = params[:identification_number])
          @users = CompleteUser.where("identification_number = '#{user_id}'")
        else
          @users = DxService.load(CompleteUser, params)
        end
        render json: @users
      end

      # GET /users/1
      def show
        render json: @user
      end

      # POST /users
      def create
        @user = User.new(user_params_to_create)
        @user.active = true

        if @user.save
          render json: @user, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /users/1
      def update
        if @user.created_by.nil?
          # Update user of created_by only this is nil
          if @user.update(user_params_to_update)
            render json: @user
          else
            render json: @user.errors, status: :unprocessable_entity
          end
        else
          if @user.update(user_params.except(:created_by))
            render json: @user
          else
            render json: @user.errors, status: :unprocessable_entity
          end
        end
      end

      # PUT /users/1/active
      def change_active
        if @user.update(user_params_to_deactivate)
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def user_params_to_create
        params.require(:user).permit(:identification_number, :oas_user_id,
                                     :user_role_id, :active,
                                     :created_by)
      end

      def user_params_to_update
        params.require(:user).permit(:identification_number, :oas_user_id,
                                     :user_role_id, :active,
                                     :updated_by)
      end

      def user_params_to_deactivate
        params.require(:user).permit(:active, :updated_by)
      end
    end
  end
end