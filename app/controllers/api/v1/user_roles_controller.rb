class Api::V1::UserRolesController < ApplicationController
  include Swagger::UserRoleApi

  before_action :set_user_role, only: [:show, :update]


  def index
    @user_roles = UserRole.all.order(:created_at)
    render json: @user_roles
  end


  def show
    render json: @user_role
  end


  def create
    @user_role = UserRole.new(user_role_params)
    if @user_role.save
      render json: @user_role, status: :created
    else
      render json: @user_role.errors, status: :unprocessable_entity
    end
  end


  def update
    if @user_role.update(user_params)
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
  def user_role_params
    params.require(:user_role).permit(:name)
  end

end
