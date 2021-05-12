class Api::V1::UserRolesController < ApplicationController
  include Swagger::UserRoleApi

  before_action :set_user_role, only: [:show, :update, :change_active]
  before_action only: [:change_active] do
    active_in_body_params? user_role_params_to_deactivate
  end

  def index
    @user_roles = UserRole.all.order(:id)
    paginate json: @user_roles
  end

  def show
    render json: @user_role
  end

  def create
    @user_role = UserRole.new(user_role_params_to_create)
    if @user_role.save
      render json: @user_role, status: :created
    else
      render json: @user_role.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user_role.update(user_role_params_to_update)
      render json: @user_role
    else
      render json: @user_role.errors, status: :unprocessable_entity
    end
  end

  # PUT /user_roles/1/active
  def change_active
    if @user_role.update(user_role_params_to_deactivate)
      render json: @user_role
    else
      render json: @user_role.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user_role
    @user_role = UserRole.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_role_params_to_create
    params.require(:user_role).permit(:name, :created_by)
  end

  def user_role_params_to_update
    params.require(:user_role).permit(:name, :updated_by)
  end

  def user_role_params_to_deactivate
    params.require(:user_role).permit(:active, :updated_by)
  end

end
