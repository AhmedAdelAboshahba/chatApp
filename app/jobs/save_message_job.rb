class SaveMessageJob < ApplicationJob
  queue_as :messages

  def perform(message_params)
    Message.create(message_params)
  end
end
