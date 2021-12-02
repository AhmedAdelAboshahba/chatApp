class Api::V1::MessagesController < Api::ApiController
  before_action :set_application
  before_action :set_chat
  before_action :set_message, only: :show

  def index
    messages = @chat.messages.all.paginate(page: page, per_page: per_page)
    json_response({messages: messages.as_json({ only: %i[number content] })}, :ok, nil, messages.total_pages, page, per_page)
  end

  def show
    json_response(@message.as_json({ only: %i[number content] }), :ok)
  end

  def create
    message = Message.new(message_params)
    message.chat_id = @chat.id
    message.number =  $cache.incr("application_#{@application.token}_chat_#{@chat.number}_messages_count")
    if message.save
      json_response(message.as_json({ only: %i[number content] }), :ok)
    else
      json_response(nil, :bad_request, message.errors.full_message)
    end
  end

  private

  def set_application
    @application = Application.find_by!(token: params[:application_id])
  end

  def set_chat
    @chat = @application.chats.find_by!(number: params[:chat_id])
  end

  def set_message
    @message = @chat.messages.find_by!(number: params[:id])
  end

  def message_params
    params.require(:message).permit(:content)
  end

end
