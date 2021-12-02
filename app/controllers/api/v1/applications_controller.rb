class Api::V1::ApplicationsController < Api::ApiController
  before_action :set_application, only: [:show, :update]

  def index
    applications = Application.all.paginate(page: page, per_page: per_page)
    json_response({applications: applications.as_json({ only: %i[token name chats_count] })}, :ok, nil, applications.total_pages, page, per_page)
  end

  def show
    json_response(@application.as_json({ only: %i[token name chats_count] }), :ok)
  end

  def create
    @application = Application.new(application_params)
    if @application.save
      ChatsCounterUpdateJob.set(wait: 1.hour).perform_later(@application)
      json_response(application_hash, :ok)
    else
      json_response(nil, :bad_request, @application.errors.full_message)
    end
  end

  def update
    if @application.update(application_params)
      json_response(application_hash, :ok)
    else
      json_response(nil, :bad_request, @application.errors.full_message)
    end
  end

  private

  def set_application
    @application = Application.find_by!(token: params[:id])
  end

  def application_params
    params.require(:application).permit(:name)
  end

  def application_hash
    {
      token: @application.token,
      name: @application.name,
      chats_count: @application.chats_count
    }
  end

end
