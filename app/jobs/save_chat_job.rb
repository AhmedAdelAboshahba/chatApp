class SaveChatJob < ApplicationJob
  queue_as :chats

  def perform(chat_params)
    chat = Chat.create(chat_params)
    MessagesCounterUpdateJob.set(wait: 1.hour).perform_later(chat)
  end
end
