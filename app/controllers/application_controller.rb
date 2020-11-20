class ApplicationController < ActionController::API

  # Handling of database exceptions
  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: {error: e.message}, status: :not_found
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: {error: e.message}, status: :unprocessable_entity
  end

  rescue_from ActiveRecord::InvalidForeignKey do |e|
    render json: {error: e.message}, status: :unprocessable_entity
  end

  def validate_created_by(params)
    user_id = params[:created_by]
    if user_id and not user_id.blank?
      begin
        @created_by_user = User.find(user_id)
      rescue ActiveRecord::RecordNotFound => e
        render json: {"error": "Usuario no encontrado con 'created_by': #{user_id}"},
               status: :unprocessable_entity
      end
    end
  end

  def validate_updated_by(params)
    user_id = params[:updated_by]
    if user_id and not user_id.blank?
      begin
        @updated_by_user = User.find(user_id)
      rescue ActiveRecord::RecordNotFound => e
        render json: {"error": "Usuario no encontrado con 'updated_by': #{user_id}"},
               status: :unprocessable_entity
      end
    end
  end
end
