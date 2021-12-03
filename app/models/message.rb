class Message < ApplicationRecord
  belongs_to :chat

  validates :number, uniqueness: { scope: :chat }

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  document_type 'message'

  settings index: { number_of_shards: 10 } do
    mapping  do
      indexes :content, type: 'string'
    end
  end

  def self.search(query, chat_id)
    __elasticsearch__.search(
      {
        query: {
          bool: {
            must: [
              {
                match: {
                  content: {
                    query: query,
                    operator: 'and'
                  }
                }
              },
              match: {
                chat_id: {
                  query: chat_id
                }
              }
            ]
          }
        }
      }
    )
  end

  
end
