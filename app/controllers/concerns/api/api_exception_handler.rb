module Api::ApiExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: json_errors(e), status: :not_found
    end
  end

  def json_errors(error)
    { errors: [error.message] }
  end
end
