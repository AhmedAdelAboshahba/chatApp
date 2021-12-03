require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :applications do
        resources :chats do
          resources :messages do
            collection do 
              get :search
            end
          end
        end
      end
    end
  end
end
