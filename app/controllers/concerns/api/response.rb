module Api::Response
  extend ActiveSupport::Concern

  def json_response(object = nil, status = :ok, error_message = nil, number_of_pages = nil, page = nil, per_page = nil)
    object ||= {}
    unless error_message.present?
      object = object.merge(page: page.to_i) if page
      object = object.merge(per_page: per_page.to_i) if per_page
      object = object.merge(number_of_pages: number_of_pages) if number_of_pages
    else
      object = object.merge(json_errors(error_message)) if error_message.present?
    end

    render json: object.to_json, status: status
  end

  private

  def json_errors(message)
    return { errors: message } if message.is_a? Array
    
    { errors: [message] }
  end
end
