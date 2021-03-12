class ApplicationController < ActionController::API

  # Handling of database exceptions
  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { error: e.message }, status: :not_found
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: { error: e.message }, status: :unprocessable_entity
  end

  rescue_from ActiveRecord::InvalidForeignKey do |e|
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def active_in_body_params? (body)
    active_in_body = (body.include? "active") || (body.include? :active)
    unless active_in_body
      render json: { error: "active can't be nil" }, status: :unprocessable_entity
    end
  end
end
