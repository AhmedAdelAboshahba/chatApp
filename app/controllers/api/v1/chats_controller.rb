class Api::V1::ChatsController < Api::ApiController
  before_action :set_application
  before_action :set_chat, only: :show

  def index
    chats = @application.chats.all.paginate(page: page, per_page: per_page)
    json_response({chats: chats.as_json({ only: %i[number messages_count] })}, :ok, nil, chats.total_pages, page, per_page)
  end

  def show
    json_response(@chat.as_json({ only: %i[number messages_count] }), :ok)
  end

  def create
    number = $cache.incr("application_#{@application.token}_chats_count")
    SaveChatJob.perform_later({number: number, application_id: @application.id})
    json_response({number: number, messages_count: 0}, :ok)
  end

  private

  def set_application
    @application = Application.find_by!(token: params[:application_id])
  end

  def set_chat
    @chat = @application.chats.find_by!(number: params[:id])
  end

end
