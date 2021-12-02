class Api::ApiController < ActionController::API
  include Api::ApiExceptionHandler
  include Api::Response
  include Pagination
end
