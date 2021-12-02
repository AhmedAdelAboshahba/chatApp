class ChatsCounterUpdateJob < ApplicationJob
  queue_as :chats_counter

  def perform(application)
    application.update(chats_count: application.chats.count)
    ChatsCounterUpdateJob.set(wait: 1.hour).perform_later(application)
  end
end
