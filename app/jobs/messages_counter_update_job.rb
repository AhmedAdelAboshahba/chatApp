class MessagesCounterUpdateJob < ApplicationJob
  queue_as :messages_counter

  def perform(chat)
    chat.update(messages_count: chat.messages.count)
    MessagesCounterUpdateJob.set(wait: 1.hour).perform_later(chat)
  end
end
